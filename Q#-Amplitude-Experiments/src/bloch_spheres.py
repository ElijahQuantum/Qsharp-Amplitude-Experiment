from qiskit import QuantumCircuit
from qiskit.visualization import plot_bloch_multivector
from qiskit.quantum_info import Statevector
import numpy as np
import matplotlib.pyplot as plt

qc = QuantumCircuit(2)
#*  Qubit 1
qc.ry(np.pi/10,0)
qc.rx(np.pi/20,0)
#*  Qubit 2
qc.ry(np.pi*2,1)
qc.rx(-20,1)

state = Statevector.from_instruction(qc)
plot_bloch_multivector(state)
plt.show()