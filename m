Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B6987D487
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 20:41:29 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6007645212
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 19:41:28 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	by lists.linaro.org (Postfix) with ESMTPS id 6A4B53F387
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 19:41:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=armlinux.org.uk header.s=pandora-2019 header.b=HCT3565W;
	spf=none (lists.linaro.org: domain of "linux+greybus-dev=lists.linaro.org@armlinux.org.uk" has no SPF policy when checking 78.32.30.218) smtp.mailfrom="linux+greybus-dev=lists.linaro.org@armlinux.org.uk";
	dmarc=pass (policy=none) header.from=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vMOcpYICmwo4NpAZCDNBpaBc/6gPeBk9CzUAQqBpilA=; b=HCT3565WV5UxuJ3TBs/5syfKBE
	V4P9LDnldEV0tQWyqel0o8jOh+aKI8AlpYnEbVxA7zJBobmemldHUiWr0ejxKyJAYlZwnazE3HrzF
	SvNajAtxCYWSpwQT1q74WfBLYSzZv+Bn8ylGD75grqz7+ShKh70Zq+CppW6zOK6vWS7QJ+JB6yzUN
	9xulcBZzWxk9I2FHGmk+RnY24ugj/5WUYifvv/kYEV4O4XxTIOjgXoB/eAF2TvlabFTsNB3BukIKU
	2p3EiIYFFdAwfIj9kEku9Y3b3jC1kcNfi3MhoW+57jSkjJDDyp9+pmOCxgplf3WdWbBNZwUnVyP1G
	qcEkNW0Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36238)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rlDQI-0001va-2k;
	Fri, 15 Mar 2024 19:40:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rlDQG-0006dz-Ut; Fri, 15 Mar 2024 19:40:56 +0000
Date: Fri, 15 Mar 2024 19:40:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <ZfSkSPD4dMe7qqhy@shell.armlinux.org.uk>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
 <20240315184908.500352-3-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240315184908.500352-3-ayushdevel1325@gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6A4B53F387
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
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,gmail.com,lists.infradead.org,lists.linaro.org];
	TAGGED_FROM(0.00)[greybus-dev=lists.linaro.org];
	R_SPF_NA(0.00)[no SPF record];
	DKIM_TRACE(0.00)[armlinux.org.uk:+];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:8468, ipnet:78.32.0.0/15, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: XTLDYXC3WRZYRLY544LANZ7KE5Y3JP2O
X-Message-ID-Hash: XTLDYXC3WRZYRLY544LANZ7KE5Y3JP2O
X-MailFrom: linux+greybus-dev=lists.linaro.org@armlinux.org.uk
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 2/8] w1: Add w1_find_master_device
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XTLDYXC3WRZYRLY544LANZ7KE5Y3JP2O/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 16, 2024 at 12:19:00AM +0530, Ayush Singh wrote:
> diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
> index afb1cc4606c5..ce8a3f93f2ef 100644
> --- a/drivers/w1/w1.c
> +++ b/drivers/w1/w1.c
> @@ -673,9 +673,9 @@ static int __w1_attach_slave_device(struct w1_slave *sl)
>  	sl->dev.of_node = of_find_matching_node(sl->master->dev.of_node,
>  						sl->family->of_match_table);
>  
> -	dev_set_name(&sl->dev, "%02x-%012llx",
> -		 (unsigned int) sl->reg_num.family,
> -		 (unsigned long long) sl->reg_num.id);
> +	dev_set_name(&sl->dev, "%s-%02x-%012llx", sl->master->name,
> +		     (unsigned int)sl->reg_num.family,
> +		     (unsigned long long)sl->reg_num.id);

This is a user visible change likely to cause breakage. I know that I've
written programmes for reading the DS18B20 temperature probes that
depend on the sysfs device name remaining stable. The same is likely
true of other program authors.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
