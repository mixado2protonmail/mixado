//SPDX-License-Identifier: UNLICENSED
pragma experimental ABIEncoderV2;

pragma solidity ^0.6.2;


interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

contract mixado{
    using SafeMath for uint256;


    mapping(string => uint256) balances;
    mapping(string => address) public tokens;
    mapping(string => uint256) fees;
    string[] tokenNames;
    address public owner;
    address ETHAddress = 0x8F8526dbfd6E38E3D8307702cA8469Bae6C56C15;
    uint256 public feeRate = 5; // 5‰

    constructor() public{
        owner = _msgSender();
        _addToken('ETH', ETHAddress);
    }

    function _msgValue() private view returns(uint256 result){
        result = msg.value;
    }

    function _msgSender() private view returns(address sender_){
        sender_ = msg.sender;
    }

    modifier onlyOwner() {
        require(_msgSender() == owner || _msgSender() == address(this), "Authority: only owner can call this function");
        _;
    }

    receive() external payable{}

    function deposit(string calldata _key, uint256 amount, string calldata _token) external payable {
        require(_msgValue() > 0 || amount > 0, "Deposit: deposit amount must be more than zero");
        if(tokens[_token] == ETHAddress){
            _depositETH(_key);
        } else {
            _depositToken(_key, amount, _token);
        }
    }

    function withdrawal(string calldata _key, address _receiver, string calldata _token) external onlyOwner {
        require(_receiver != address(0), "Withdrawal: receiver address can not be address(0)");
        if(tokens[_token] == ETHAddress){
            _withdrawalETH(_key, _receiver);
        } else {
            _withdrawalToken(_key, _receiver, _token);
        }
    }

    function getFee() external onlyOwner{
        getETHFee();
        getTokenFee();
    }

    function getETHFee() private{
        uint256 ETHFee = address(this).balance;
        require(ETHFee > 0, "GETFEE: fee of ETH amount must be more than zero");
        (bool success, ) = address(owner).call{value: ETHFee}("");
        require(success, "GETFEE: get ETH fee failed");
    }

    function getTokenFee() private{
        for(uint i = 1; i < tokenNames.length; i++) {
            uint256 tokenFee = fees[tokenNames[i]];
            require(tokenFee > 0, "GETFEE: fee of token amount must be more than zero");
            IERC20 token = IERC20(tokens[tokenNames[i]]);
            bool success = token.transfer(owner, tokenFee);
            require(success, "GETFEE: get token fee failed");
        }
    }

    function _depositETH(string memory _key) private {
        require(_msgValue() > 0, "Deposit: deposit ETH amount must be more than zero");
        balances[_key] = _msgValue();
    }

    function _depositToken(string memory _key, uint256 amount, string memory _token) private {
        require(amount > 0, "Deposit: deposit token amount must be more than zero");
        IERC20 token = IERC20(tokens[_token]);
        token.approve(address(this), amount);
        token.transferFrom(_msgSender(), address(this), amount);
        balances[_key] = balances[_key].add(amount);
    }

    function _withdrawalETH(string memory _key, address _receiver) private {
        uint256 balance = balances[_key];
        require(balance > 0, "Withdrawal: withdrawal amount must be more than zero");
        uint256 fee = balance.mul(feeRate).div(1000); // 5‰ fee
        fees['ETH'] = fees['ETH'].add(fee);
        balance = balance.sub(fee);
        (bool success, ) = address(_receiver).call{ value: balance }("");
        require(success, "Withdrawal: transfer ETH failed");
    }

    function _withdrawalToken(string memory _key, address _receiver, string memory _token) private {
        uint256 balance = balances[_key];
        require(balance > 0, "Withdrawal: withdrawal amount must be more than zero");
        uint256 fee = balance.mul(feeRate).div(1000);
        fees[_token] = fees[_token].add(fee);
        balance = balance.sub(fee); // 5‰ fee
        IERC20 token = IERC20(tokens[_token]);
        bool success = token.transfer(_receiver, balance);
        require(success, "Withdrawal: transfer ETH failed");
    }

    function allTokens() external view returns(string[] memory token) {
        token = tokenNames;
    }

    function _addToken(string memory tokenName, address tokenAddress) private {
        if(tokens['ETH'] != ETHAddress){
            tokens['ETH'] = ETHAddress;
            tokenNames.push("ETH");
            fees['ETH'] = 0;
        } else {
            tokens[tokenName] = tokenAddress;
            tokenNames.push(tokenName);
            fees[tokenName] = 0;
        }
    }

    function addToken(string calldata tokenName, address tokenAddress) external onlyOwner {
        _addToken(tokenName, tokenAddress);
    }

    function depositOf(string calldata _key) external view onlyOwner returns(uint256 result){
        result = balances[_key];
    }

    function updateFeeRate(uint256 newFee) external onlyOwner{
        require(newFee < 1000, "Fee: can not charge 100% fee");
        require(newFee != feeRate, "Fee: the same fee rate");
        feeRate = newFee;
    }

    // TODO this function is used for testing, the official press release deleted.
    function get() external view returns(uint256){
        return address(this).balance;
    }
}