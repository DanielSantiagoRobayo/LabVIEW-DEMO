<?xml version='1.0' encoding='utf-8'?>
<Project Type="Project" LVVersion="22308000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="01 - Varias modulaciones (SIG 2)" Type="Folder">
			<Item Name="Transmitter_Example_V4.vi" Type="VI" URL="../Transmitter_Example_V4.vi" />
			<Item Name="Receiver_Example - 2 Channel - Experiment_17.vi" Type="VI" URL="../Receiver_Example - 2 Channel - Experiment_17.vi" />
		</Item>
		<Item Name="02 - Demo con brazos (un SIG)" Type="Folder">
			<Item Name="Transmitter_Example.vi" Type="VI" URL="../Transmitter_Example.vi" />
			<Item Name="Receiver_Example - 2 Channel - Experiment_13.vi" Type="VI" URL="../Receiver_Example - 2 Channel - Experiment_13.vi" />
		</Item>
		<Item Name="03 - Receptor de referencia" Type="Folder">
			<Item Name="Receiver_Example.vi" Type="VI" URL="../Receiver_Example.vi" />
		</Item>
		<Item Name="Controles" Type="Folder">
			<Item Name="USRP_CoercedParameters.ctl" Type="VI" URL="../USRP_CoercedParameters.ctl" />
			<Item Name="USRP_ControledParameters.ctl" Type="VI" URL="../USRP_ControledParameters.ctl" />
			<Item Name="WLAN_ModulationControl.ctl" Type="VI" URL="../WLAN_ModulationControl.ctl" />
			<Item Name="angle_speed_def.ctl" Type="VI" URL="../angle_speed_def.ctl" />
		</Item>
		<Item Name="SubVIs" Type="Folder">
			<Item Name="APP_Bit2Byte.vi" Type="VI" URL="../APP_Bit2Byte.vi" />
			<Item Name="APP_Byte2Bit - Kopie1.vi" Type="VI" URL="../APP_Byte2Bit - Kopie1.vi" />
			<Item Name="APP_Byte2Bit.vi" Type="VI" URL="../APP_Byte2Bit.vi" />
			<Item Name="FilterArray_Graphic_CH1.vi" Type="VI" URL="../FilterArray_Graphic_CH1.vi" />
			<Item Name="FilterArray_Graphic_CH1_LP.vi" Type="VI" URL="../FilterArray_Graphic_CH1_LP.vi" />
			<Item Name="FilterArray_Graphic_HP.vi" Type="VI" URL="../FilterArray_Graphic_HP.vi" />
			<Item Name="FilterArray_Graphic_LP.vi" Type="VI" URL="../FilterArray_Graphic_LP.vi" />
			<Item Name="OFDM_BitDetect.vi" Type="VI" URL="../OFDM_BitDetect.vi" />
			<Item Name="OFDM_Demodulation.vi" Type="VI" URL="../OFDM_Demodulation.vi" />
			<Item Name="OFDM_FrequencyOffsetEstimation(CP).vi" Type="VI" URL="../OFDM_FrequencyOffsetEstimation(CP).vi" />
			<Item Name="OFDM_Modulation.vi" Type="VI" URL="../OFDM_Modulation.vi" />
			<Item Name="OFDM_SuperpositionedBitDetect.vi" Type="VI" URL="../OFDM_SuperpositionedBitDetect.vi" />
			<Item Name="OFDM_SuperpositionedBitDetectV3.vi" Type="VI" URL="../OFDM_SuperpositionedBitDetectV3.vi" />
			<Item Name="OFDM_SymbolMaping.vi" Type="VI" URL="../OFDM_SymbolMaping.vi" />
			<Item Name="OFDM_TransimitPreparation.vi" Type="VI" URL="../OFDM_TransimitPreparation.vi" />
			<Item Name="ObtainExpectedString.vi" Type="VI" URL="../ObtainExpectedString.vi" />
			<Item Name="ObtainExpectedString2.vi" Type="VI" URL="../ObtainExpectedString2.vi" />
			<Item Name="ObtainExpectedString3.vi" Type="VI" URL="../ObtainExpectedString3.vi" />
			<Item Name="ObtainExpectedString4.vi" Type="VI" URL="../ObtainExpectedString4.vi" />
			<Item Name="PayloadHPLP.vi" Type="VI" URL="../PayloadHPLP.vi" />
			<Item Name="SNR_Symbols1.vi" Type="VI" URL="../SNR_Symbols1.vi" />
			<Item Name="SNR_Symbols2.vi" Type="VI" URL="../SNR_Symbols2.vi" />
			<Item Name="USRP_RXInit.vi" Type="VI" URL="../USRP_RXInit.vi" />
			<Item Name="USRP_TXInit.vi" Type="VI" URL="../USRP_TXInit.vi" />
			<Item Name="WLAN_BCCDecode.vi" Type="VI" URL="../WLAN_BCCDecode.vi" />
			<Item Name="WLAN_BCCEncode.vi" Type="VI" URL="../WLAN_BCCEncode.vi" />
			<Item Name="WLAN_ChannelEstimation.vi" Type="VI" URL="../WLAN_ChannelEstimation.vi" />
			<Item Name="WLAN_Descrambler.vi" Type="VI" URL="../WLAN_Descrambler.vi" />
			<Item Name="WLAN_FrameAnalysis.vi" Type="VI" URL="../WLAN_FrameAnalysis.vi" />
			<Item Name="WLAN_FrameAnalysisV3.vi" Type="VI" URL="../WLAN_FrameAnalysisV3.vi" />
			<Item Name="WLAN_FrameAnalysis_Convencional.vi" Type="VI" URL="../WLAN_FrameAnalysis_Convencional.vi" />
			<Item Name="WLAN_FrameBuild.vi" Type="VI" URL="../WLAN_FrameBuild.vi" />
			<Item Name="WLAN_FrameCapture - 2 Channels.vi" Type="VI" URL="../WLAN_FrameCapture - 2 Channels.vi" />
			<Item Name="WLAN_FrameCapture.vi" Type="VI" URL="../WLAN_FrameCapture.vi" />
			<Item Name="WLAN_FrameContent.vi" Type="VI" URL="../WLAN_FrameContent.vi" />
			<Item Name="WLAN_FrameContentV2.vi" Type="VI" URL="../WLAN_FrameContentV2.vi" />
			<Item Name="WLAN_FrameSync.vi" Type="VI" URL="../WLAN_FrameSync.vi" />
			<Item Name="WLAN_FrequencyOffsetEstimation(LTF).vi" Type="VI" URL="../WLAN_FrequencyOffsetEstimation(LTF).vi" />
			<Item Name="WLAN_FrequencyOffsetEstimation(STF).vi" Type="VI" URL="../WLAN_FrequencyOffsetEstimation(STF).vi" />
			<Item Name="WLAN_LTF.vi" Type="VI" URL="../WLAN_LTF.vi" />
			<Item Name="WLAN_SNR_LTF.vi" Type="VI" URL="../WLAN_SNR_LTF.vi" />
			<Item Name="WLAN_STF.vi" Type="VI" URL="../WLAN_STF.vi" />
			<Item Name="WLAN_Scrambler.vi" Type="VI" URL="../WLAN_Scrambler.vi" />
			<Item Name="WLAN_Scrambler_RX.vi" Type="VI" URL="../WLAN_Scrambler_RX.vi" />
			<Item Name="WLAN_SigBuild.vi" Type="VI" URL="../WLAN_SigBuild.vi" />
			<Item Name="WLAN_SigBuild2.vi" Type="VI" URL="../WLAN_SigBuild2.vi" />
			<Item Name="WLAN_SigContent.vi" Type="VI" URL="../WLAN_SigContent.vi" />
			<Item Name="WLAN_SigContent2.vi" Type="VI" URL="../WLAN_SigContent2.vi" />
			<Item Name="WLAN_SuperposedFrameBuild.vi" Type="VI" URL="../WLAN_SuperposedFrameBuild.vi" />
			<Item Name="WLAN_SuperposedFrameBuild_MOD.vi" Type="VI" URL="../WLAN_SuperposedFrameBuild_MOD.vi" />
			<Item Name="WLAN_SuperposedFrameBuild_V4.vi" Type="VI" URL="../WLAN_SuperposedFrameBuild_V4.vi" />
			<Item Name="color-green.vi" Type="VI" URL="../color-green.vi" />
			<Item Name="color-red-2.vi" Type="VI" URL="../color-red-2.vi" />
			<Item Name="color-red.vi" Type="VI" URL="../color-red.vi" />
			<Item Name="is_moving.vi" Type="VI" URL="../is_moving.vi" />
			<Item Name="is_paused.vi" Type="VI" URL="../is_paused.vi" />
			<Item Name="send_angles.vi" Type="VI" URL="../send_angles.vi" />
			<Item Name="wave.vi" Type="VI" URL="../wave.vi" />
		</Item>
		<Item Name="Dependencies" Type="Dependencies" />
		<Item Name="Build Specifications" Type="Build" />
	</Item>
</Project>