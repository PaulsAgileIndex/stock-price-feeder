

## ResponseEntity implementation
[Asynchronous REST results in Spring](http://niels.nu/blog/2016/spring-async-rest.html)
...For performance reasons Spring doesn’t just create a new thread for every request but 
instead uses a pool with worker threads (named 'http-nio-8080-exec-#') that handle 
these requests. By default it has 10 of these workers allowing it to handle 10 requests in parallel.