Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFE296CF23
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2024 08:24:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0548242529
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2024 06:24:53 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by lists.linaro.org (Postfix) with ESMTPS id 71DCB42529
	for <greybus-dev@lists.linaro.org>; Thu,  5 Sep 2024 06:24:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ti.com header.s=ti-com-17Q1 header.b=KWB7lLrl;
	spf=pass (lists.linaro.org: domain of d-gole@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=d-gole@ti.com;
	dmarc=pass (policy=quarantine) header.from=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4856OdQ0126456;
	Thu, 5 Sep 2024 01:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725517479;
	bh=QHY7aIQgu0/LpQAFB21rB6xj4hPz2sP1c8vqFpug2ks=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=KWB7lLrldCMcrA4sDY8xo25+lfJ1OgStwEVc0EleuOBM8OqBM0NSTdyvIwX4lsyw5
	 AWZc1+ApAKUNYZaHMLgJRmnIifcsbFTlyCawmbqL/NcJ35ypKxWWqMVvsd0ypVf16l
	 2ZcCi/ZCqi5ni4z5USjIuDowtjwujIYNQ7SmC0ak=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4856OdEd026537
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Sep 2024 01:24:39 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Sep 2024 01:24:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Sep 2024 01:24:39 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.68] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4856OcOX069679;
	Thu, 5 Sep 2024 01:24:39 -0500
Date: Thu, 5 Sep 2024 11:54:38 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Ayush Singh <ayush@beagleboard.org>
Message-ID: <20240905062438.ae2rajmcoiukjefm@lcpd911>
References: <20240903-beagleplay_fw_upgrade-v4-0-526fc62204a7@beagleboard.org>
 <20240903-beagleplay_fw_upgrade-v4-2-526fc62204a7@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240903-beagleplay_fw_upgrade-v4-2-526fc62204a7@beagleboard.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Rspamd-Action: no action
X-Spamd-Bar: --
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 71DCB42529
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=ti-com-17Q1];
	R_SPF_ALLOW(-0.20)[+ip4:198.47.23.248/30:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[198.47.23.248:from];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_TWELVE(0.00)[22];
	ASN(0.00)[asn:161, ipnet:198.47.23.0/24, country:US];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[ti.com:dkim,ti.com:email];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ti.com:+]
Message-ID-Hash: ACG4CD5O6JBYRLG5MNZ4BKQACUPXK2GL
X-Message-ID-Hash: ACG4CD5O6JBYRLG5MNZ4BKQACUPXK2GL
X-MailFrom: d-gole@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: lorforlinux@beagleboard.org, robertcnelson@beagleboard.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 2/3] arm64: dts: ti: k3-am625-beagleplay: Add bootloader-backdoor-gpios to cc1352p7
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ACG4CD5O6JBYRLG5MNZ4BKQACUPXK2GL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: 7bit

On Sep 03, 2024 at 15:02:19 +0530, Ayush Singh wrote:
> Add bootloader-backdoor-gpios which is required for enabling bootloader
> backdoor for flashing firmware to cc1352p7.
> 
> Also fix the incorrect reset-gpio.

A Fixes tag please?

> 
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
> ---
>  arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> index 70de288d728e..a1cd47d7f5e3 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> @@ -888,7 +888,8 @@ &main_uart6 {
>  
>  	mcu {
>  		compatible = "ti,cc1352p7";
> -		reset-gpios = <&main_gpio0 72 GPIO_ACTIVE_LOW>;
> +		bootloader-backdoor-gpios = <&main_gpio0 13 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&main_gpio0 14 GPIO_ACTIVE_HIGH>;
>  		vdds-supply = <&vdd_3v3>;

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
