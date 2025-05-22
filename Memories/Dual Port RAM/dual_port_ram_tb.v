`timescale 1ns / 1ps

module dual_port_ram_tb;

    // Inputs
    reg clka, clkb;
    reg ena, wea;
    reg enb, web;
    reg [2:0] ada, adb;
    reg [7:0] ina, inb;
    
    // Outputs
    wire [7:0] outa, outb;
    
    // Instantiate UUT
    dual_port_ram uut (
        .clka(clka),
        .clkb(clkb),
        .ena(ena),
        .wea(wea),
        .enb(enb),
        .web(web),
        .ada(ada),
        .adb(adb),
        .ina(ina),
        .inb(inb),
        .outa(outa),
        .outb(outb)
    );

    // Clock Generation
    integer i;
    initial begin
        clka = 0;
        forever #5 clka = ~clka; // 100MHz clock
    end

    initial begin
        clkb = 0;
        forever #7 clkb = ~clkb; // ~71.4MHz clock
    end

    // Main Test Sequence
    initial begin
        // Initialize
        ena = 0; wea = 0; 
        enb = 0; web = 0;
        ada = 0; adb = 0;
        ina = 0; inb = 0;
        
        // Allow clocks to stabilize
        #20;

        // PORT A: Write Sequence (Addresses 0-3)
        ena = 1; wea = 1;
        for (i=0; i<4; i=i+1) begin
            ada = i;
            ina = 8'hA0 + i;
            @(negedge clka); // Wait for clock edge
        end
        wea = 0;

        // PORT B: Write Sequence (Addresses 4-7)
        enb = 1; web = 1;
        for (i=4; i<8; i = i+1) begin
            adb = i;
            inb = 8'hB0 + (i-4);
            @(negedge clkb); // Wait for clock edge
        end
        web = 0;

        // Read Operations
        #20;
        ena = 1; enb = 1;
        
        // Read Port A (0-3) and Port B (4-7)
        for (i=0; i<4; i=i+1) begin
            ada = i;
            adb = i+4;
            @(negedge clka);
            @(negedge clkb);
        end

        // Cross-read Test (A reads B's area, B reads A's area)
        for (i=0; i<4; i=i+1) begin
            ada = i+4;  // Read B's addresses
            adb = i;   // Read A's addresses
            @(negedge clka);
            @(negedge clkb);
        end

        // Finalize
        #50;
        $finish;
    end

    // Monitoring
    initial begin
        $display("\nTime\t\t\t\t\tPort A (ena | wea | ada |  ina | outa)\tPort B (enb | web | adb | inb | outb)");
        $monitor("%t               %h   %h    %h     %h    %h                 %h    %h    %h    %h    %h",
            $time,
            ena, wea, ada, ina, outa,
            enb, web, adb, inb, outb);
    end

endmodule