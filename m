Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5632487D47B
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 20:33:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5DF38451F3
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 19:33:39 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	by lists.linaro.org (Postfix) with ESMTPS id CB46C3F387
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 19:33:32 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=armlinux.org.uk header.s=pandora-2019 header.b=RLU+jv1w;
	spf=none (lists.linaro.org: domain of "linux+greybus-dev=lists.linaro.org@armlinux.org.uk" has no SPF policy when checking 78.32.30.218) smtp.mailfrom="linux+greybus-dev=lists.linaro.org@armlinux.org.uk";
	dmarc=pass (policy=none) header.from=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=f0Ij9Ng3qFlKHBcCYFWC7NUcoSVwuVabrhGU+kT7tbo=; b=RLU+jv1w7ZdSAxv++3QgRTZbWf
	4vjrKzoM0i/woxMVS/lsbrXobofT40yChxO9gTsZcRbj3GLv94jEbzhmabLFiEIhMTKotsJOLI3Se
	xus1fCT3ykkOk8OL6p3h5vchYrpDaWO4hGigLfKlc86mFK9hK1F+DlLbdu3dHg2DzKbnFOFpVBjUB
	O51jrli51xcMZVAcWUgRrmdTTN159H/KSwvXrP25gEzjL1vcwgiQOkbCdlGIJYTKA7trqp741apPO
	q0ULoeCjbRyVtJR54Bk9m52c1gYlC9PMeEsTlVx8rXRTp6gTAAJphFyrJ26G8RDGvMbzDSqLmQ2Se
	NUMKVsqw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59454)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rlDId-0001uq-28;
	Fri, 15 Mar 2024 19:33:03 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rlDIX-0006d1-OV; Fri, 15 Mar 2024 19:32:57 +0000
Date: Fri, 15 Mar 2024 19:32:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <ZfSiaT9WltBDY9yD@shell.armlinux.org.uk>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
 <20240315184908.500352-8-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240315184908.500352-8-ayushdevel1325@gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: CB46C3F387
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.90 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_FROMHOST_NORESOLVE_MX(0.50)[dead.armlinux.org.uk];
	DMARC_POLICY_ALLOW(-0.50)[armlinux.org.uk,none];
	R_DKIM_ALLOW(-0.20)[armlinux.org.uk:s=pandora-2019];
	RWL_MAILSPIKE_GOOD(-0.10)[78.32.30.218:from];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[greybus-dev=lists.linaro.org];
	URIBL_BLOCKED(0.00)[elinux.org:url];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,gmail.com,lists.infradead.org,lists.linaro.org];
	R_SPF_NA(0.00)[no SPF record];
	DKIM_TRACE(0.00)[armlinux.org.uk:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:8468, ipnet:78.32.0.0/15, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: CCUR4AM3D5M4WGVVJ2C4HQDZZ3MRTVJC
X-Message-ID-Hash: CCUR4AM3D5M4WGVVJ2C4HQDZZ3MRTVJC
X-MailFrom: linux+greybus-dev=lists.linaro.org@armlinux.org.uk
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 7/8] mikrobus: Add mikrobus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CCUR4AM3D5M4WGVVJ2C4HQDZZ3MRTVJC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 16, 2024 at 12:19:05AM +0530, Ayush Singh wrote:
> diff --git a/drivers/misc/mikrobus/Kconfig b/drivers/misc/mikrobus/Kconfig
> new file mode 100644
> index 000000000000..f0770006b4fe
> --- /dev/null
> +++ b/drivers/misc/mikrobus/Kconfig
> @@ -0,0 +1,19 @@
> +menuconfig MIKROBUS
> +	tristate "Module for instantiating devices on mikroBUS ports"
> +	depends on GPIOLIB
> +	depends on W1
> +	depends on W1_MASTER_GPIO
> +	help
> +	  This option enables the mikroBUS driver. mikroBUS is an add-on
> +	  board socket standard that offers maximum expandability with
> +	  the smallest number of pins. The mikroBUS driver instantiates
> +	  devices on a mikroBUS port described by identifying data present
> +	  in an add-on board resident EEPROM, more details on the mikroBUS
> +	  driver support and discussion can be found in this eLinux wiki :
> +	  elinux.org/Mikrobus

I think this is a fallacy. I have boards that support Mikrobus - some of
the SolidRun products do. I have several Mikrobus "click" boards.

This help text seems to imply that Mikrobus click boards include an
EEPROM that identify them, hence you make the support for mikroBUS
depend on it. No, this is not the case - the click boards do not
contain a 1-wire EEPROM.

Please fetch a copy of the official Mikrobus specification which is
available here:

https://download.mikroe.com/documents/standards/mikrobus/mikrobus-standard-specification-v200.pdf

and rather than creating something that is implementation specific but
appears to be generic, create something that is generic with
implementation specific extensions.

You'll find if you search that document, no mention is made of an
"eprom". "identification" is also not found. "one wire", "onewire",
"1-wire", "1wire" are also not found.

What I'm concerned about is if we create this "Mikrobus" subsystem
which appears to be dependent on one-wire EEPROMs somewhere in the
system, and then end up with a load of drivers for various mikroBUS
boards, what about cases where there is no one-wire EEPROM?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
