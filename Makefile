
VBC=vbc
SN=sn
CPP=cpp

SRCS = \
	AssemblyInfo.vb \
	Microsoft.VisualBasic.Compatibility.VB6/BaseControlArray.vb \
	Microsoft.VisualBasic.Compatibility.VB6/ButtonArray.generated.vb \
	Microsoft.VisualBasic.Compatibility.VB6/CheckBoxArray.generated.vb \
	Microsoft.VisualBasic.Compatibility.VB6/ComboBoxArray.generated.vb \
	Microsoft.VisualBasic.Compatibility.VB6/GroupBoxArray.generated.vb \
	Microsoft.VisualBasic.Compatibility.VB6/LabelArray.generated.vb \
	Microsoft.VisualBasic.Compatibility.VB6/LoadResConstants.vb \
	Microsoft.VisualBasic.Compatibility.VB6/PictureBoxArray.generated.vb \
	Microsoft.VisualBasic.Compatibility.VB6/RadioButtonArray.generated.vb \
	Microsoft.VisualBasic.Compatibility.VB6/ScaleMode.vb \
	Microsoft.VisualBasic.Compatibility.VB6/Support.vb \
	Microsoft.VisualBasic.Compatibility.VB6/TextBoxArray.generated.vb \
	Microsoft.VisualBasic.Compatibility.VB6/ToolStripMenuItemArray.generated.vb

all: Microsoft.VisualBasic.Compatibility.dll
.PHONY: all

%.generated.vb: %.vb.cpp Microsoft.VisualBasic.Compatibility.VB6/ControlArrayCommon.vb.h 
	$(CPP) -P -w $< -o $@

Microsoft.VisualBasic.Compatibility.dll: $(SRCS)
	$(VBC) -target:library -debug+ -define:_MYTYPE='"Empty"' -out:$@ $(SRCS)
	$(SN) -R $@ mono.snk

