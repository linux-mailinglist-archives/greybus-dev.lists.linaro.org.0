Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB79745D10
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Jul 2023 15:24:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0A7A93F032
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Jul 2023 13:24:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 649D23F032
	for <greybus-dev@lists.linaro.org>; Mon,  3 Jul 2023 13:24:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=I8F8HmNd;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EE8E460F2F;
	Mon,  3 Jul 2023 13:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39712C433C9;
	Mon,  3 Jul 2023 13:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688390649;
	bh=VZy2IJH5Zp0zLi0PzjAHnGOCdKj0aY+Y8o+P9lCkN1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I8F8HmNdG9BW6Pn4dfstQ/++oGyIpGpnFDwBv6EyIJeOEdyYDkgIV5YWLJfCW0+tC
	 o6mCKWnNKCf2IN6T7HZx9RGCl7mo5S7T9t2qvOoBcXxXlYC5buXgKjENv8PgmitGG9
	 4npV7+PBamAUU6t68b1Z1l6Ci2FxPDe5d2TyfGDI=
Date: Mon, 3 Jul 2023 15:23:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tuo Li <islituo@gmail.com>
Message-ID: <2023070352-upscale-bankable-76a7@gregkh>
References: <20230626084339.998784-1-islituo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626084339.998784-1-islituo@gmail.com>
X-Spamd-Result: default: False [-3.50 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,outlook.com,buaa.edu.cn];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	URIBL_BLOCKED(0.00)[buaa.edu.cn:email,linuxfoundation.org:dkim,dfw.source.kernel.org:helo,dfw.source.kernel.org:rdns];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 649D23F032
X-Spamd-Bar: ---
Message-ID-Hash: XROXKUMB4UE6XLHDAN4Y6DK7TA5XCFTW
X-Message-ID-Hash: XROXKUMB4UE6XLHDAN4Y6DK7TA5XCFTW
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, baijiaju1990@outlook.com, BassCheck <bass@buaa.edu.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix a possible data-inconsistency due to data race in get_serial_info()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XROXKUMB4UE6XLHDAN4Y6DK7TA5XCFTW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 26, 2023 at 04:43:39PM +0800, Tuo Li wrote:
> The variables gb_tty->port.close_delay and gb_tty->port.closing_wait are
> ofter accessed together while holding the lock gb_tty->port.mutex. Here is 
> an example in set_serial_info():
> 
>   mutex_lock(&gb_tty->port.mutex);
>   ...
>   gb_tty->port.close_delay = close_delay;
>   gb_tty->port.closing_wait = closing_wait;
>   ...
>   mutex_unlock(&gb_tty->port.mutex);
> 
> However, they are accessed without holding the lock gb_tty->port.mutex when
> are accessed in get_serial_info():
> 
>   ss->close_delay = jiffies_to_msecs(gb_tty->port.close_delay) / 10;
>   ss->closing_wait =
>     gb_tty->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
> 	ASYNC_CLOSING_WAIT_NONE :
> 	jiffies_to_msecs(gb_tty->port.closing_wait) / 10;
> 
> In my opinion, this may be a harmful race, because ss->close_delay can be
> inconsistent with ss->closing_wait if gb_tty->port.close_delay and 
> gb_tty->port.closing_wait are updated by another thread after the 
> assignment to ss->close_delay.

And how can that happen?

Also you have trailing whitespace in your changelog text :(

> Besides, the select operator may return wrong value if 
> gb_tty->port.closing_wait is updated right after the condition is 
> calculated.
> 
> To fix this possible data-inconsistency caused by data race, a lock and 
> unlock pair is added when accessing different fields of gb_tty->port.
> 
> Reported-by: BassCheck <bass@buaa.edu.cn>

As per the documentation for research tools like this, you need to
explain how this was tested.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
