const DigitalPicture = artifacts.require("DigitalPicture");

contract("DigitalPicture", async function (accounts) {
  // 가상 계좌 중 하나 선택
  const [owner] = accounts;

  beforeEach(async function () {
    // Constructor 호출
    this.token = await DigitalPicture.new();
  });

  it("publish item", async function () {
    const tokenId = await this.token.publishItem(
      owner,
      "http://dev.sample.com/a/b/abc.jpg"
    );

    console.log(tokenId);
  });
});
