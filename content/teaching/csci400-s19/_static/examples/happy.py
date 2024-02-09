"""
Happy Numbers Module

:Author: Jack Rosenthal

Recursive definition: A number is happy if and only if it is the number
1, or the sum of each of the digits squared is happy.

This module provides only one function: ``happy``, which takes a number
and determines if it is happy.

To use this function in your code, place this module in the same
directory and type::

    from happy import happy

"""

__all__ = ['happy']


def happy(n):
    """
    Given a number ``n``, return ``True`` if that number is happy,
    ``False`` otherwise.

    >>> happy(10)
    True
    >>> happy(11)
    False
    """
    if n in happy.store.keys():
        return happy.store[n]
    happy.store[n] = False
    digit_sum = 0
    r = n
    while r > 0:
        digit_sum += (r % 10) ** 2
        r //= 10
    if digit_sum == 1:
        result = True
    else:
        result = happy(digit_sum)
    happy.store[n] = result
    return result


happy.store = {}
