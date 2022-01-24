require 'fiddle'

libc = Fiddle.dlopen('/lib64/libc.so.6')

resourceinfo = Fiddle::Function.new(
  libc['nproc'],
  Fiddle::CUnionEntity.size(
  [ Fiddle::TYPE_DOUBLE,
    Fiddle::TYPE_INT,
    Fiddle::TYPE_CHAR,
    Fiddle::TYPE_VOIDP ]) #=> 8
)

puts resourceinfo.call()
