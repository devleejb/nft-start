pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol"; // NFT 토큰마다 고유 주소가 필요한데, Counters Smart Contract를 이용하면 순차적으로 발급할 수 있음, 라이브러리성 Smart Contract

contract DigitalPicture is ERC721URIStorage {
    // Library는 using이라는 키워드와 함께 쓰인다.
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // Smart Contract가 이더리움 블록체인에 배포되는 시점에 실행
    constructor() ERC721("DigitalPicture", "NDP") {}

    // Web3.js를 이용할 때, public으로 선언된 함수만 javascript에서 호출할 수 있다.
    function publishItem(address creator, string memory tokenURI)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newTokenId = _tokenIds.current();

        // ERC20과 달리 ERC721은 토큰 내에 소유주에 대한 정보가 기록된다.
        // ERC20은 토큰이 탈취될 경우 소유권을 확인할 수 있는 방법이 없다.
        _mint(creator, newTokenId);
        _setTokenURI(newTokenId, tokenURI);

        return newTokenId;
    }
}
