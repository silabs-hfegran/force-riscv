#
# Copyright (C) [2020] Futurewei Technologies, Inc.
#
# FORCE-RISCV is licensed under the Apache License, Version 2.0
#  (the "License"); you may not use this file except in compliance
#  with the License.  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES
# OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO
# NON-INFRINGEMENT, MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
# See the License for the specific language governing permissions and
# limitations under the License.
#
import RandomUtils
import StateTransition
from Enums import EStateElementType
from State import State

import state_transition_test_utils
from DV.riscv.trees.instruction_tree import BranchJump_map
from base.Sequence import Sequence
from riscv.EnvRISCV import EnvRISCV
from riscv.GenThreadRISCV import GenThreadRISCV


# This test verifies that StateTransitions yield the expected State with
# interleaved branch instructions.
class MainSequence(Sequence):
    def __init__(self, aGenThread, aName=None):
        super().__init__(aGenThread, aName)

        self._mExpectedStateData = {}

    def generate(self, **kargs):
        for _ in range(3):
            state = self._createState()

            self._genRandomBranchInstructions()

            StateTransition.transitionToState(state)
            state_transition_test_utils.verifyState(
                self, self._mExpectedStateData
            )

            self._genRandomBranchInstructions()

    # Generate a random number of random branch instructions.
    def _genRandomBranchInstructions(self):
        for _ in range(RandomUtils.random32(100, 200)):
            instr = BranchJump_map.pick(self.genThread)
            self.genInstruction(instr)

    # Create a random State to test an explicit StateTransition.
    def _createState(self):
        state = State()
        test_utils = state_transition_test_utils
        self._mExpectedStateData[
            EStateElementType.Memory
        ] = test_utils.addRandomMemoryStateElements(
            self, state, RandomUtils.random32(0, 20)
        )
        self._mExpectedStateData[
            EStateElementType.GPR
        ] = test_utils.addRandomGprStateElements(
            self, state, RandomUtils.random32(0, 20)
        )
        self._mExpectedStateData[
            EStateElementType.FloatingPointRegister
        ] = test_utils.addRandomFloatingPointRegisterStateElements(
            self, state, RandomUtils.random32(0, 20)
        )
        self._mExpectedStateData[
            EStateElementType.PC
        ] = test_utils.addRandomPcStateElement(self, state)

        return state


MainSequenceClass = MainSequence
GenThreadClass = GenThreadRISCV
EnvClass = EnvRISCV
