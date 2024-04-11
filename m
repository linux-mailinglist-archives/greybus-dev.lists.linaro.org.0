Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DCC8A13E7
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Apr 2024 14:03:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5CC4240F79
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Apr 2024 12:03:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id B3E8E45235
	for <greybus-dev@lists.linaro.org>; Thu, 11 Apr 2024 12:03:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=dKYDMK3i;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4647561DD5;
	Thu, 11 Apr 2024 12:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B608C433C7;
	Thu, 11 Apr 2024 12:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712837030;
	bh=oltkbgJz/lUcQWtwkLke/qM0DU1bwDW6wogBIn+i780=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dKYDMK3iUyUAOAqGAdXCtZqI4PHO1hUEa+vVgCaVnZbP7/HZax/WvuruCdVXLpiZ+
	 fITLONyNAJrOiKejW9o5JiBe6r4Usq9A7jldYoqRvOgU2Gker3Xf+qBKZhsG5F6NFY
	 ZDQkPjOsDABS8Kmf+z23LoZuYVWxnhMHXfdm2XqM=
Date: Thu, 11 Apr 2024 14:03:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <2024041103-nimbly-pounce-aa36@gregkh>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
 <20240315184908.500352-7-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240315184908.500352-7-ayushdevel1325@gmail.com>
X-Rspamd-Queue-Id: B3E8E45235
X-Spamd-Bar: ++
X-Spamd-Result: default: False [2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[linuxfoundation.org:dkim];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,gmail.com,lists.infradead.org,lists.linaro.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Spam-Level: **
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: OHSX3FXY6MAQTADPDTSEV6NBBB5JX4WC
X-Message-ID-Hash: OHSX3FXY6MAQTADPDTSEV6NBBB5JX4WC
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 6/8] greybus: Add mikroBUS manifest types
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OHSX3FXY6MAQTADPDTSEV6NBBB5JX4WC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 16, 2024 at 12:19:04AM +0530, Ayush Singh wrote:
> Add data structures for parsing mikroBUS manifests, which are based on
> greybus manifest.
> 
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> ---
>  include/linux/greybus/greybus_manifest.h | 49 ++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/include/linux/greybus/greybus_manifest.h b/include/linux/greybus/greybus_manifest.h
> index bef9eb2093e9..83241e19d9b3 100644
> --- a/include/linux/greybus/greybus_manifest.h
> +++ b/include/linux/greybus/greybus_manifest.h
> @@ -23,6 +23,9 @@ enum greybus_descriptor_type {
>  	GREYBUS_TYPE_STRING		= 0x02,
>  	GREYBUS_TYPE_BUNDLE		= 0x03,
>  	GREYBUS_TYPE_CPORT		= 0x04,
> +	GREYBUS_TYPE_MIKROBUS		= 0x05,
> +	GREYBUS_TYPE_PROPERTY		= 0x06,
> +	GREYBUS_TYPE_DEVICE		= 0x07,

These need approval in the spec before we can add them here.

And you are adding 3 different things here, not just one.  Shouldn't
this be 3 patches?


>  };
>  
>  enum greybus_protocol {
> @@ -151,6 +154,49 @@ struct greybus_descriptor_cport {
>  	__u8	protocol_id;	/* enum greybus_protocol */
>  } __packed;
>  
> +/*
> + * A mikrobus descriptor is used to describe the details
> + * about the bus ocnfiguration for the add-on board
> + * connected to the mikrobus port.
> + */
> +struct greybus_descriptor_mikrobus {
> +	__u8 pin_state[12];
> +} __packed;
> +
> +/*
> + * A property descriptor is used to pass named properties
> + * to device drivers through the unified device properties
> + * interface under linux/property.h
> + */
> +struct greybus_descriptor_property {
> +	__u8 length;
> +	__u8 id;
> +	__u8 propname_stringid;
> +	__u8 type;
> +	__u8 value[];

Don't we have a "counted-by" marking that we can use to show how big
value[] here is?

> +} __packed;
> +
> +/*
> + * A device descriptor is used to describe the
> + * details required by a add-on board device
> + * driver.
> + */
> +struct greybus_descriptor_device {
> +	__u8 id;
> +	__u8 driver_stringid;
> +	__u8 protocol;
> +	__u8 reg;
> +	__le32 max_speed_hz;
> +	__u8 irq;
> +	__u8 irq_type;
> +	__u8 mode;
> +	__u8 prop_link;
> +	__u8 gpio_link;
> +	__u8 reg_link;
> +	__u8 clock_link;
> +	__u8 pad[1];

Why the padding?

And this looks like a greybus thing, not a mikrobus thing, right?  Some
description of exactly what this is and what it does would be good.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
