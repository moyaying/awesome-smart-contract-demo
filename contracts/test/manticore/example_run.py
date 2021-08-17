from manticore.ethereum import ManticoreEVM
import os

m = ManticoreEVM()

ETHER = 10**18

user_account = m.create_account(balance=1000*ETHER)
current_dir = os.path.dirname(os.path.abspath(__file__))

with open(os.path.join(current_dir, 'example.sol')) as f:
    contract_account = m.solidity_create_contract(f, owner=user_account)

symbolic_var = m.make_symbolic_value()
contract_account.f(symbolic_var)

print("Results are in {}".format(m.workspace))
m.finalize()  # stop the exploration
