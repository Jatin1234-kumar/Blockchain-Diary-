// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Blockchain Diary
/// @notice Simple on-chain diary that timestamps entries per address. No imports, no constructor.
contract BlockchainDiary {
    struct Entry {
        uint256 timestamp;
        string content; // store encrypted text or IPFS CID for privacy
    }

    // Each address has an array of entries
    mapping(address => Entry[]) private entries;

    /// @notice Emitted when a new diary entry is added
    event EntryAdded(address indexed author, uint256 indexed index, uint256 timestamp, string note);

    /// @notice Add a diary entry for the caller (msg.sender). Timestamp is block.timestamp.
    /// @param content The entry content (plaintext, encrypted text, or IPFS CID).
    function addEntry(string calldata content) external {
        entries[msg.sender].push(Entry({timestamp: block.timestamp, content: content}));
        emit EntryAdded(msg.sender, entries[msg.sender].length - 1, block.timestamp, content);
    }

    /// @notice Number of entries for an address
    /// @param user Address to query
    /// @return count Number of entries
    function entriesCount(address user) external view returns (uint256 count) {
        return entries[user].length;
    }

    /// @notice Get a specific entry for a user
    /// @param user Owner of the entry
    /// @param index 0-based index of the entry
    /// @return timestamp Timestamp when entry was added
    /// @return content Entry content
    function getEntry(address user, uint256 index) public view returns (uint256 timestamp, string memory content) {
        require(index < entries[user].length, "Index out of bounds");
        Entry storage e = entries[user][index];
        return (e.timestamp, e.content);
    }

    /// @notice Get the caller's last entry
    /// @return timestamp Timestamp of last entry
    /// @return content Content of last entry
    function getMyLastEntry() external view returns (uint256 timestamp, string memory content) {
        uint256 len = entries[msg.sender].length;
        require(len > 0, "No entries");
        Entry storage e = entries[msg.sender][len - 1];
        return (e.timestamp, e.content);
    }

    /// @notice Fetch a range of entries (inclusive) for a user
    /// @dev end must be >= start and both within bounds
    /// @param user Owner address
    /// @param start Start index (inclusive)
    /// @param end End index (inclusive)
    /// @return timestamps Array of timestamps
    /// @return contents Array of contents
    function getEntriesRange(
        address user,
        uint256 start,
        uint256 end
    ) external view returns (uint256[] memory timestamps, string[] memory contents) {
        uint256 len = entries[user].length;
        require(len > 0, "No entries");
        require(start <= end, "start > end");
        require(end < len, "end out of range");

        uint256 size = end - start + 1;
        timestamps = new uint256[](size);
        contents = new string[](size);

        for (uint256 i = 0; i < size; ++i) {
            Entry storage e = entries[user][start + i];
            timestamps[i] = e.timestamp;
            contents[i] = e.content;
        }
    }

    /// @notice Return keccak256 hash of an entry's content (useful for off-chain verification)
    /// @param user Owner address
    /// @param index Entry index
    /// @return hash Keccak256 hash of the content
    function entryContentHash(address user, uint256 index) external view returns (bytes32 hash) {
        require(index < entries[user].length, "Index out of bounds");
        return keccak256(bytes(entries[user][index].content));
    }

    /// @notice Emit an event with a short note and timestamp without storing content on-chain
    /// @dev Useful gas-optimised alternative: store the full content off-chain and emit a content hash or short note.
    /// @param note A short note (keeps gas lower than pushing long strings to storage)
    function addEventNote(string calldata note) external {
        emit EntryAdded(msg.sender, entries[msg.sender].length, block.timestamp, note);
        // No storage write to save gas; frontends can index this event
    }

    // No delete or edit functions are provided to keep history immutable and simple.
}

