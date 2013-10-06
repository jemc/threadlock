threadlock
==========

Use the threadlock function in your class definition to automatically run instance methods inside of an instance-wide re-entrant lock (Monitor).

All locked methods in an instance are protect by a single lock.  Alternatively, you can specify a custom lock, which need not be a Monitor; it can be anything that implements $synchronize

You can protect all or some of your methods from being run asynchronously.

In Ruby>=2.1, threadlock can also be syntactically used as a decorator.

See USAGE.rb for usage examples.

Enjoy.

Copyright 2013 : Joe McIlvain

(MIT License)