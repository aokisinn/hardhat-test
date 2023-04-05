// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MemberNFT is ERC721Enumerable, ERC721URIStorage, Ownable {
    /**
     * @dev
     * - _tokenIdsはCountersの全関数が利用可能
     * コードの詳細は以下参考
     * https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol
     */
    // CountersのCounterライブラリを使用する
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    /**
     * @dev
     * - 誰にどのtokenId,URIでNFTをmintしたかを記録する
     */
    event TokenURIChanged(address indexed to, uint256 indexed tokenId, string uri);

    constructor() ERC721("MemberNFT", "MEM") {}

    /**
     * @dev
     * - このコントラクトをデプロイしたアドレスだけがmint可能 onlyOwner
     */
    function nftMint(address to, string calldata uri) external onlyOwner {
        // トークンの状態を更新する
        _tokenIds.increment();
        // 最新のトークンIDを取得する
        uint256 newTokenId = _tokenIds.current();
        // Mint処理を実行する
        _mint(to, newTokenId);
        // URLを指定して発行
        _setTokenURI(newTokenId, uri);
        // イベント発行
        emit TokenURIChanged(to, newTokenId, uri);
    }

    /**
     * @dev
     * - オーバーライド
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal override(ERC721, ERC721Enumerable) {
        // 元の関数を呼び出す際はsuper経由で呼び出す
        super._beforeTokenTransfer(from, to, tokenId);
    }

    /**
     * @dev
     * - オーバーライド
     */
    function _burn(uint256 tokenId)
        internal
        override(ERC721, ERC721URIStorage)
    {
        super._burn(tokenId);
    }

    /**
     * @dev
     * - オーバーライド
     */
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    /**
     * @dev
     * - オーバーライド
     */
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}
