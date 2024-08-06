def am_i_old(age):
  if age < 18:
    return "you're a kid"
  else:
    return "you're an adult"
  
def distance(a, b):
  (ax, ay) = a
  (bx, by) = b
  dx = bx - ax
  dy = by - ay
  return (dx * dx + dy * dy) ** 0.5

def main():
  #return "Hello, world!"
  #return am_i_old(16)
  return distance((10.0, 10.0), (20.0, 20.0))