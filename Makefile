VERILOG = iverilog
TARGET = bcd.vcd
TEMP = temp.vvp

$(TARGET) : $(TEMP)
	vvp $(TEMP)
	
$(TEMP): bcd_tb.v seg7.v bcd.v dff.v
	$(VERILOG) -o $(TEMP) bcd_tb.v seg7.v bcd.v dff.v
	
clean:
	-del $(TARGET)
	-del $(TEMP)