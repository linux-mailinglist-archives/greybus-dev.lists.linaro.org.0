Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D07F7BB6A2
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Oct 2023 13:40:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8AAEA40CAB
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Oct 2023 11:40:18 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by lists.linaro.org (Postfix) with ESMTPS id 56CDA40C28
	for <greybus-dev@lists.linaro.org>; Fri,  6 Oct 2023 11:40:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ti.com header.s=ti-com-17Q1 header.b=XTzBvQ0H;
	spf=none (lists.linaro.org: domain of nm@ti.com has no SPF policy when checking 198.47.19.142) smtp.mailfrom=nm@ti.com;
	dmarc=pass (policy=quarantine) header.from=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 396Be2Nn068407;
	Fri, 6 Oct 2023 06:40:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696592402;
	bh=SYR+FJnxDTeTJXoAKcUnoHUqRZqvUPXO1UdO50un8No=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=XTzBvQ0HcdNlT9b5HKfzoO+avrUYBauEVhCqAHIAvH5wrQNufGWTE2848lerkTPC+
	 YQdB3DjzjnK32zvDem6MpcTA/UFulfrUIODS6VQfwB2nb2slhrONFVwe27I5wX3Drz
	 CiMHWdivdWKyNWU+FLWCqW7RzZWBXZ1JFzjrVpGM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 396Be2Hu003975
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Oct 2023 06:40:02 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Oct 2023 06:40:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Oct 2023 06:40:02 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 396Be2fK029335;
	Fri, 6 Oct 2023 06:40:02 -0500
Date: Fri, 6 Oct 2023 06:40:02 -0500
From: Nishanth Menon <nm@ti.com>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <20231006114002.w2ed6i5ksaibu4sx@shrimp>
References: <20231006041035.652841-1-ayushdevel1325@gmail.com>
 <20231006041035.652841-4-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231006041035.652841-4-ayushdevel1325@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.80 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ti.com:s=ti-com-17Q1];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:161, ipnet:198.47.19.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	R_SPF_NA(0.00)[no SPF record];
	URIBL_BLOCKED(0.00)[ti.com:dkim,beagleboard.org:url,fllv0016.ext.ti.com:helo,fllv0016.ext.ti.com:rdns];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 56CDA40C28
Message-ID-Hash: X4YNYTF6QLJ2XAGZNCMST2I65UY3VAQH
X-Message-ID-Hash: X4YNYTF6QLJ2XAGZNCMST2I65UY3VAQH
X-MailFrom: nm@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v8 3/3] dts: ti: k3-am625-beagleplay: Add beaglecc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/X4YNYTF6QLJ2XAGZNCMST2I65UY3VAQH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: 7bit

On 09:40-20231006, Ayush Singh wrote:
> The BeaglePlay board by BeagleBoard.org has a CC1352P7 co-processor
> connected to the main AM62 (running Linux) over UART. In the BeagleConnect
> Technology, CC1352 is responsible for handling 6LoWPAN communication with
> beagleconnect freedom nodes as well as their discovery.
> 
> This mcu is used by gb-beagleplay, a Greybus driver for BeaglePlay.
> 
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> index 7cfdf562b53b..5160923b4dc2 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> @@ -870,6 +870,10 @@ &main_uart6 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&wifi_debug_uart_pins_default>;
>  	status = "okay";
> +
> +	mcu {
> +		compatible = "ti,cc1352p7";

I suggest to go ahead and describe the fixed regulator and clocks as in
the beagleplay schematics as well.

> +	};
>  };
>  
>  &dss {
> -- 
> 2.41.0
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
