package tcpcongestion.simulations;

import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.node.ethernet.Eth100M;
import inet.node.ethernet.Eth10M;
import inet.node.ethernet.EtherSwitch;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;
import inet.visualizer.linklayer.DataLinkVisualizer;
import inet.visualizer.linklayer.InterfaceTableCanvasVisualizer;


@license(LGPL);
//
// TODO documentation
//
network Network
{
    @display("bgb=722,328");
    submodules:
        configurator: IPv4NetworkConfigurator {
            parameters:
                @display("p=426,27");
        }
        client1: StandardHost {
            @display("p=29,79");
        }
        client2: StandardHost {
            @display("p=29,208");
        }
        router: Router {
            @display("p=199,145");
        }
        router1: Router {
            @display("p=358,145");
        }
        server1: StandardHost {
            @display("p=545,79");
        }
        server2: StandardHost {
            @display("p=545,208");
        }
        iPv4NetworkConfigurator: IPv4NetworkConfigurator {
            @display("p=286,18");
        }
        visualizer: IntegratedCanvasVisualizer {
            @display("p=155,0");
        }
        switch1: EtherSwitch {
            @display("p=96,144");
        }
        switch2: EtherSwitch {
            @display("p=457,144");
        }
    connections:
        router.ethg++ <--> Eth100M <--> router1.ethg++;
        client1.ethg++ <--> Eth10M <--> switch1.ethg++;
        client2.ethg++ <--> Eth10M <--> switch1.ethg++;
        switch1.ethg++ <--> Eth10M <--> router.ethg++;
        router1.ethg++ <--> Eth10M <--> switch2.ethg++;
        switch2.ethg++ <--> Eth10M <--> server1.ethg++;
        switch2.ethg++ <--> Eth10M <--> server2.ethg++;
}

