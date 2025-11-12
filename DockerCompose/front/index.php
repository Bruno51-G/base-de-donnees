<?php

$c = new Memcached();
$c->addServer('cache', 11211);
$hits = $c->get('api-hits') ?? 0;

header('Content-type: text/plain');
printf("API's been hit %d times\n", $hits);
