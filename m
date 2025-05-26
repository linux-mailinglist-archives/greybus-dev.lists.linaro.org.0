Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A7FAC3F39
	for <lists+greybus-dev@lfdr.de>; Mon, 26 May 2025 14:21:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BCE5D443DE
	for <lists+greybus-dev@lfdr.de>; Mon, 26 May 2025 12:21:16 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id 630964403B
	for <greybus-dev@lists.linaro.org>; Mon, 26 May 2025 12:21:14 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=bBGKqiE4;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3605BA4F17B;
	Mon, 26 May 2025 12:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744D5C4CEE7;
	Mon, 26 May 2025 12:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748262073;
	bh=mytcLpZz6AofQLf9F+CrXUdF0yok+LQaFAFoxJ83VAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBGKqiE4Z6x/dw/rINwGVrjGP60jB88fED9lJw+pVz4NUflviZLkpbJ5gqc9JMJXR
	 +D9XZmz6LJHNqT2xKF8xwl2tSpHtkFpwgtHqZjdR2UGOMl4pHOZWJIXVTFlGZprx2/
	 KHGHkCr9qKxOXXB+5z8PRlcckIOORMntq6uviHCc=
Date: Mon, 26 May 2025 14:21:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: clingfei <clf700383@gmail.com>
Message-ID: <2025052633-drizzly-disprove-42d0@gregkh>
References: <20250526110654.3916536-1-clf700383@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250526110654.3916536-1-clf700383@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Queue-Id: 630964403B
X-Spamd-Bar: /
Message-ID-Hash: LYQ6VQJP2B74U4ECSPRFCBEOGGGN3SK3
X-Message-ID-Hash: LYQ6VQJP2B74U4ECSPRFCBEOGGGN3SK3
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, johan@kernel.org, vireshk@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Avoid fake flexible array for response data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LYQ6VQJP2B74U4ECSPRFCBEOGGGN3SK3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 26, 2025 at 07:06:54PM +0800, clingfei wrote:
> diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
> index 820134b0105c..14395f9300d6 100644
> --- a/include/linux/greybus/greybus_protocols.h
> +++ b/include/linux/greybus/greybus_protocols.h
> @@ -110,11 +110,6 @@ struct gb_control_get_manifest_size_response {
>  	__le16			size;
>  } __packed;
>  
> -/* Control protocol manifest get request has no payload */
> -struct gb_control_get_manifest_response {
> -	__u8			data[0];
> -} __packed;
> -
>  /* Control protocol [dis]connected request */
>  struct gb_control_connected_request {
>  	__le16			cport_id;
> @@ -678,10 +673,6 @@ struct gb_i2c_transfer_request {
>  	__le16				op_count;
>  	struct gb_i2c_transfer_op	ops[];		/* op_count of these */
>  } __packed;
> -struct gb_i2c_transfer_response {
> -	__u8				data[0];	/* inbound data */
> -} __packed;
> -
>  
>  /* GPIO */
>  

Why are you deleting these structures that userspace uses?  Are you sure
you can do this?  How was this tested?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
