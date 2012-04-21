tryit
=====

another version of try


Instead of 
  some_object.try(:gsub!, /\D/, '') 
you can do this 
  some_object.try{ gsub!(/\D/, '') }