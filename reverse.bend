def reverse(my_list):
  fold my_list:
    case List/Cons:
      return List/concat(my_list.tail, [my_list.head])
    case List/Nil:
      return my_list

def reverse_recursive(my_list, acc):
  match my_list:
    case List/Cons:
      return reverse_recursive(my_list.tail, List/concat([my_list.head], acc))
    case List/Nil:
      return acc

def main():
  return reverse([1, 2, 3])
  # return reverse_recursive([1,2,3], [])
