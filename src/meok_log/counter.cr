module MeokLog

  # Basic counter, only purpose is to have an instance of a incremetable value.
  #
  # Starts at 0 and increments by 1.
  #
  # To create a counter:
  # ```
  # counter = Counter.new
  # ```
  class Counter

    # Start value of the counter.
    @count : Int32 = 0

    # Retrieve current value of the counter.
    getter :count

    # Increments the count.
    #
    # Example :
    # ```
    # counter.increments
    # p counter.count # => 1
    # ```
    def increments
      @count += 1
    end
  end
end
