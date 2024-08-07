#Utils
def contains(str, char):
  match str:
    case String/Cons:
      if str.head == char:
        return 1 #For some reason builin Bool/True or False isn't found
      else:
        return contains(str.tail, char)
    case String/Nil:
      return 0

def replaceFirst(str, target, src):
  match str:
    case String/Cons:
      if str.head == target:
        return String/Cons(src, str.tail)
      else:
        return String/Cons(str.head, replaceFirst(str.tail, target, src))
    case String/Nil:
      return str

def equals(list1, list2):
  (length1, *) = List/length(list1)
  (length2, *) = List/length(list2)
  if length1 != length2:
    return 0
  else:
    match list1:
      case List/Cons:
        match list2:
          case List/Cons:
            if list1.head == list2.head:
              return equals(list1.tail, list2.tail)
            else:
              return 0
          case List/Nil:
            return 1
      case List/Nil:
        return 1
#-----------------------

def allSpringArrengments(record):
  bend r = record:
    when contains(r, '?') > 0:
      tree = ![fork(replaceFirst(r, '?', '.')), fork(replaceFirst(r, '?', '#'))] #Is a tree needed here? maybe list is enough?
    else:
      tree = !r 
  return tree

def calcGroupsOfDamagedSpringsInternal(record, prev, acc):
  match record:
    case String/Cons:
      if record.head == '#':
        if prev == '#':
          match acc: # For some reason [acc.head + 1, acc.tail] doesn't work
            case List/Cons:
              return calcGroupsOfDamagedSpringsInternal(record.tail, record.head, List/concat([acc.head + 1], acc.tail))
            case List/Nil: # Should not happen
              return calcGroupsOfDamagedSpringsInternal(record.tail, record.head, acc)
        else:
          return calcGroupsOfDamagedSpringsInternal(record.tail, record.head, List/concat([1], acc))
      else:
        return calcGroupsOfDamagedSpringsInternal(record.tail, record.head, acc)
    case String/Nil:
      return List/reverse(acc)

def calcGroupsOfDamagedSprings(record):
  return calcGroupsOfDamagedSpringsInternal(record, ' ', [])

def possibleSpringsArrengmentCount(record, groupsOfDamagedSprings):
  all = allSpringArrengments(record)
  fold all:
    case Tree/Node:
      return all.left + all.right
    case Tree/Leaf:
      if equals(calcGroupsOfDamagedSprings(all.value), groupsOfDamagedSprings) > 0:
        return 1
      else:
        return 0

def main():
  input = TEST_INPUT
  fold input:
    case List/Cons:
      (record, groupsOfDamagedSprings) = input.head
      return List/concat([possibleSpringsArrengmentCount(record, groupsOfDamagedSprings)], input.tail)
    case List/Nil:
      return input

TEST_INPUT = [
    ("???.###", [1,1,3]),
    (".??..??...?##.", [1,1,3]),
    ("?#?#?#?#?#?#?#?", [1,3,1,6]),
    ("????.#...#...", [4,1,1]),
    ("????.######..#####.", [1,6,5]),
    ("?###????????", [3,2,1])
  ]