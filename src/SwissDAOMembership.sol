// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

contract SwissDAOMembership is
    ERC721,
    ERC721Enumerable,
    ERC721URIStorage,
    ERC721Burnable,
    Ownable
{
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    string public websiteUrl;

    constructor(string memory _url) ERC721("SwissDAOMembership", "SDM") {
        websiteUrl = _url;
    }

    /// @dev Mint Membership NFT.
    function safeMint() public onlyOwner {
        _tokenIdCounter.increment();
        uint256 tokenId = _tokenIdCounter.current();
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, _tokenURI(msg.sender));
    }

    /// @dev Render the JSON Metadata for a given Membership NFT.
    /// @param _holder Address of the holder.
    function _tokenURI(address _holder) public view returns (string memory) {
        string memory holder = Strings.toHexString(
            uint256(uint160(_holder)),
            20
        );
        string memory name = string.concat("Membership of ", holder);
        string memory url = string.concat(websiteUrl, holder);
        string memory imageUrl = string.concat(
            websiteUrl,
            "teaser.png",
            "?holder=",
            holder
        );

        return
            string(
                abi.encodePacked(
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name":"',
                                name,
                                '", "description":"SwissDAO Membership", ',
                                '"attributes": [], ',
                                '"image":"',
                                imageUrl,
                                '", "external_url":"',
                                url,
                                '", "animation_url":"',
                                url,
                                '"}'
                            )
                        )
                    )
                )
            );
    }

    /// @dev Base URI for Metadata.
    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    /// @dev Update Website URL for displaying membership cards.
    /// @param _url New Website URL.
    function setWebsiteUrl(string memory _url) external onlyOwner {
        websiteUrl = _url;
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId,
        uint256 batchSize
    ) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    function _burn(
        uint256 tokenId
    ) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(
        uint256 tokenId
    ) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(
        bytes4 interfaceId
    ) public view override(ERC721, ERC721Enumerable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
