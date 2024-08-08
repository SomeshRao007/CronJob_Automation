// Define the file path for logging
$logFile = '/home/ec2-user/hello/hello_world.log';

// Get the current time
$currentTime = date('Y-m-d H:i:s');


//function getAndIncrementCount() {
//    static $count = 0; // Static variable to retain value between invocations
//    $count++;
//    return $count;
//}

//$currentCount = getAndIncrementCount();

// Increment the count
//$currentCount = $previousCount + 1;

// Prepare the log message
$logMessage = "Hello, World! , Time: {$currentTime}\n";
//Count: {$currentCount}, Time: {$currentTime}\n";

// Write the message to the log file
file_put_contents($logFile, $logMessage);

// Print the message to the browser
echo $logMessage;

?>
