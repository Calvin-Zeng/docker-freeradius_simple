freeradius_simple
----

This freeradius server in docker is only for developing used.

NOTICE: Do not use on public internet!

How to use?
-----

1. Build the dockerfile by command.
`sudo docker build -t freeradius:simple . --no-cache`

2. Modify the authorize and clients.conf by your requirement.

3. Run a container from freeradius:simple image.
`sudo docker run -t -i --name freeradius_simple -p 1812:1812/udp -p 1813:1813/udp -v $(pwd)/authorize:/etc/freeradius/3.0/mods-config/files/authorize -v $(pwd)/clients.conf:/etc/freeradius/3.0/clients.conf freeradius:simple /bin/bash`

**In the container...**   

4. sudo chown freerad:freerad /etc/freeradius/3.0/mods-config/files/authorize /etc/freeradius/3.0/clients.conf

5. freeradius -X

6. Ctrl + P then Ctrl + Q to dettach the container.

Show the freeradius log.
-----
`sudo docker logs -f freeradius_simple`