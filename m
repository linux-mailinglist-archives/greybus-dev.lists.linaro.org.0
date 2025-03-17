Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFD2A6426C
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Mar 2025 08:01:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C325544739
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Mar 2025 07:01:24 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id 41A293F679
	for <greybus-dev@lists.linaro.org>; Mon, 17 Mar 2025 07:01:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=F5VBEoTF;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 39A29A41AA0;
	Mon, 17 Mar 2025 06:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E96FC4CEEC;
	Mon, 17 Mar 2025 07:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742194880;
	bh=aBPpmUcGDUxtVqNYBJ0y1S8mhJ2vEs38pfC3bkBgSxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F5VBEoTF11phoho4ypFGxNctozFRv+i9J46Vxp2mq479IyHBO7fyElGFis6V1TKlh
	 5JWjBPsa8D3NCl3F5KnUxekvFFMtb2rKKywyaJAAPgjfrNAeCSeTawyk4V7Xo4vqmT
	 EpbLzb1LWK1bJ6Hq1yoKYAGJNdO1bGYOPi0Q/fa8=
Date: Mon, 17 Mar 2025 08:00:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <2025031738-variable-desecrate-ec2f@gregkh>
References: <20250220111606.138045-1-jirislaby@kernel.org>
 <2025031738-fabric-alright-6a32@gregkh>
 <e8fb71ea-84cb-427a-9dc9-9c44ec0db08f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8fb71ea-84cb-427a-9dc9-9c44ec0db08f@kernel.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 41A293F679
X-Spamd-Bar: --
X-Spamd-Result: default: False [-3.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.98%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[147.75.193.91:from];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	URIBL_BLOCKED(0.00)[linuxfoundation.org:dkim];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lunn.ch,linux.intel.com,gmail.com,davemloft.net,google.com,lists.linaro.org,lists.linux.dev,redhat.com,linaro.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[netdev];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
Message-ID-Hash: JV5JWMG4QRUPGCAEY5APR6RX27GBZMXG
X-Message-ID-Hash: JV5JWMG4QRUPGCAEY5APR6RX27GBZMXG
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Lin <dtwlin@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, greybus-dev@lists.linaro.org, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, linux-alpha@vger.kernel.org, linux-staging@lists.linux.dev, Matt Turner <mattst88@gmail.com>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Rob Herring <robh@kernel.org>, sparclinux@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/29] tty: cleanup no. 99
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JV5JWMG4QRUPGCAEY5APR6RX27GBZMXG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 17, 2025 at 05:59:01AM +0100, Jiri Slaby wrote:
> On 17. 03. 25, 5:28, Greg KH wrote:
> > On Thu, Feb 20, 2025 at 12:15:37PM +0100, Jiri Slaby (SUSE) wrote:
> > > Hi,
> > > 
> > > this is (again) a series of cleanup in tty. I am trying to rework
> > > tty+serial to avoid limitations of devices (so called NR_UART or
> > > tty_alloc_driver()'s first parameter). And the below popped up while
> > > crawling through the code. So this is only a prep cleanup.
> > > 
> > > * many tty flags are now enums
> > > * many functions were improved for readability
> > > * quite a few unused or old code dropped
> > > 
> > > In particular, the runtime behaviour of the kernel before and after the
> > > changes is supposed to be bug to bug compatible (except moxa's ioctl
> > > and ISA evils dropped). That is, noone should notice.
> > 
> > Were you going to do a new respin of this, or do you want me to take
> > this as-is and you will send a follow-up ones for the commented-on
> > changes?
> 
> I planned to send a v2 on Fri, but did not make it. I will today.

Not a problem, just wanted to make sure I didn't drop these on my side
accidentally.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
