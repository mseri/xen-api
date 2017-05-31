import unittest
import os
import mock


def simple_urandom(length):
    return 'f' * length


class TestRandom(unittest.TestCase):
    @mock.patch('os.urandom', side_effect=simple_urandom)
    def test_urandom(self, urandom_function):
        assert os.urandom(5) == 'fffff'


# the following is needed to allow 'time_vm_boots' to find the python XenAPI
# library even if it is not installed.
import sys
sys.path.append('./scripts/examples/python')


# if the script containing your code does not contain dashes in the name
# or other 'illegal' character, it can be imported like any other module,
# otherwise you can do it as follows:
#
#     python_code = __import__('python-code')
#
# this is not recommended but does the job
time_vm_boots = __import__('time-vm-boots')

# it is possible to use nose helpers to write cleaner tests
from nose.tools import assert_equal

def test_register_metrics_and_dump_table():
    session = mock.Mock()
    # we need to prepare the outputs of the various session calls
    # that are made in the time_vm_boots that we want to test.
    # For this specific example, a static constant reply is
    # good enough. Note the need for `return_value`:
    config = {"VM.return_value.get_name_label.return_value": "test",
              "VM_guest_metrics.return_value.get_other.return_value": "fake_id"}
    session.configure_mock(**config)

    # session will now respond to VM.get_name_label and VM_guest_metrics.get_other
    time_vm_boots.register_vm_metrics(session, "fake_ref", "vgm")
    # here we check that the map has been correctly updated
    assert_equal(time_vm_boots.vgm_to_vm["vgm"], "fake_ref")

    # this will call the map, print something and return nothing/
    # It is a useful exercise to modify this part of the test
    # to check that we are printing the correct value to screen;
    assert_equal(
        time_vm_boots.dump_table(session),
        None
    )

# For more, see:
# Nose documentation: http://nose.readthedocs.io/en/latest
# Mock documentation: http://www.voidspace.org.uk/python/mock

# To check a command stdout there is an example in the mock
# tutorial: http://www.voidspace.org.uk/python/mock/patch.html

# To run the tests, just execute nosetests
