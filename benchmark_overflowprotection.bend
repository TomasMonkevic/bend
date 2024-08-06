def Sum(start, target):
  if start == target:
    return (0, start)
  else:
    half = (start + target) / 2
    left = Sum(start, half)
    (leftOverflowCount, leftRemainder) = left
    right = Sum(half + 1, target)
    (rightOverflowCount, rightRemainder) = right
    remainderSum = leftRemainder + rightRemainder
    if remainderSum < leftRemainder: #overflow happened
      return (leftOverflowCount + rightOverflowCount + 1, remainderSum)
    else:
      return (leftOverflowCount + rightOverflowCount, remainderSum)

def main():
  # TODO: This could be made as an utility ULong/BigUInt
  # Result = (overflowCount * (2^24)) + remainder)
  return Sum(1, 1_000_000)