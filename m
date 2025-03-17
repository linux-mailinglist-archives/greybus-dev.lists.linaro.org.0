Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E50A63E3A
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Mar 2025 05:29:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7C4D8424FF
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Mar 2025 04:29:31 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id 3A9313F51E
	for <greybus-dev@lists.linaro.org>; Mon, 17 Mar 2025 04:29:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=Sa9fIDuK;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4963AA48A45;
	Mon, 17 Mar 2025 04:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286C1C4CEEC;
	Mon, 17 Mar 2025 04:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742185766;
	bh=3jYGVUq7uZgiXolwju9jzN3CjqHhocS2Q0Jc6ljkDd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sa9fIDuKHudF1TNOPy+8ByAv+e0eagvO3VVecHk7x34dJWkSqXj1QzvO8J1Rc4a1X
	 aysnDUQQy+axn/ruFMBWZCgb8eHiofju6EheMOQtoSNMbxOCkG3UWOysvF+qj0/oVi
	 sw7WjB3LdvTTWSJ3deYfPyXCLV9f/9M5zxAElX1E=
Date: Mon, 17 Mar 2025 05:28:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Message-ID: <2025031738-fabric-alright-6a32@gregkh>
References: <20250220111606.138045-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250220111606.138045-1-jirislaby@kernel.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3A9313F51E
X-Spamd-Bar: +
X-Spamd-Result: default: False [1.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[147.75.193.91:from];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[netdev];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lunn.ch,linux.intel.com,gmail.com,davemloft.net,google.com,lists.linaro.org,lists.linux.dev,redhat.com,linaro.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Spam-Level: *
X-Rspamd-Action: no action
Message-ID-Hash: 4UFKBM4QKJWGLFO5SFX4Y7GSVGEKEKE2
X-Message-ID-Hash: 4UFKBM4QKJWGLFO5SFX4Y7GSVGEKEKE2
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Lin <dtwlin@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, greybus-dev@lists.linaro.org, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, linux-alpha@vger.kernel.org, linux-staging@lists.linux.dev, Matt Turner <mattst88@gmail.com>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Rob Herring <robh@kernel.org>, sparclinux@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/29] tty: cleanup no. 99
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4UFKBM4QKJWGLFO5SFX4Y7GSVGEKEKE2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 20, 2025 at 12:15:37PM +0100, Jiri Slaby (SUSE) wrote:
> Hi,
> 
> this is (again) a series of cleanup in tty. I am trying to rework
> tty+serial to avoid limitations of devices (so called NR_UART or
> tty_alloc_driver()'s first parameter). And the below popped up while
> crawling through the code. So this is only a prep cleanup.
> 
> * many tty flags are now enums
> * many functions were improved for readability
> * quite a few unused or old code dropped
> 
> In particular, the runtime behaviour of the kernel before and after the
> changes is supposed to be bug to bug compatible (except moxa's ioctl
> and ISA evils dropped). That is, noone should notice.

Were you going to do a new respin of this, or do you want me to take
this as-is and you will send a follow-up ones for the commented-on
changes?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
