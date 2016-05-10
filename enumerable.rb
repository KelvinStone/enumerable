module Enumerable

  def my_each    
    for element in self
      yield(element) if block_given?
    end
    self
  end
     
  def my_each_with_index    
    for i in 0...self.size
      yield(self[i], i) if block_given?
    end
    self
  end
  
  def my_select
	if block_given?
		result = []
		for element in self
			result << element if yield(element)
		end
	end
	result
  end
  
  def my_all?
	if block_given?		
		for element in self
			return false unless yield(element) 			
		end
		true
	end		
  end
  
  def my_any?
	if block_given?		
		for element in self
			return true if yield(element) 			
		end
		false
	end		
  end
  	
  def my_none?
	if block_given?		
		for element in self
			return false if yield(element) 			
		end
		true
	end		
  end
  
  def my_count(obj=nil)
	result = 0	
	if block_given?
		for element in self 
			result += 1 if yield(element)
		end
	elsif obj != nil	
		for element in self
			result += 1 if element == obj
		end
	else 
		for element in self
			result += 1
		end
	end
	result
  end
  
  def my_map
	result = []
	for element in self
		result << yield(element) if block_given?
	end
	result
  end
  
  def my_map_proc
	result = []
	for element in self
		result << proc.call(element) 
	end
	result
  end
  
  def my_map_proc_block(proc = nil)
	result = []
	if proc && block_given? 
		for element in self
			result << yield(proc.call(element))
		end
	elsif proc && !block_given? 
		for element in self
			result << proc.call(element) 
		end	
	elsif proc.nil? && block_given? 
		for element in self
			result << yield(element)
		end	
	end
	result
  end  
   
  def my_inject(initial_value = nil)	
	if initial_value != nil 
		result = initial_value 
		for element in self
			result = yield(result, element)
		end
	else
		result = self[0]	
		for element in self.drop(1)
			result = yield(result, element)
		end
	end
	result
  end
  
  def multiply_els(arr)
	arr.my_inject {|x, y| x * y}
  end
   
end
