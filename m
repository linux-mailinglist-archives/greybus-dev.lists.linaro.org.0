Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD539754BA
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Sep 2024 15:56:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EC56D44109
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Sep 2024 13:55:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id D737E40F28
	for <greybus-dev@lists.linaro.org>; Wed, 11 Sep 2024 13:55:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=u7vhr9Px;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D98835C06CA;
	Wed, 11 Sep 2024 13:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC673C4CEC0;
	Wed, 11 Sep 2024 13:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726062955;
	bh=UwC8kaCVcmXjbd6pLkYBElYcedPsNinPtJpQLxzsBX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u7vhr9PxvvlJ4OgB5Fdz/YCFWw1qZUI4wDj5+FuwALYIhmXu3TUfzoOL+7pTGN/Zz
	 0PRZTQ135sJjOmY1s//90G3SQbByUio+0jK/LasLe0O0JPR658IHMySswjYNBlde1Y
	 g57nZH3tmAPC4ohBZX/U5pQC86Hxm7J5b6ob6+lE=
Date: Wed, 11 Sep 2024 15:55:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Message-ID: <2024091142-quill-tableful-3c3e@gregkh>
References: <SJ2P223MB102660087EA9382BE5287FDBF7912@SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM>
 <Zt7vVaxF2XP-_ZMA@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zt7vVaxF2XP-_ZMA@hovoldconsulting.com>
X-Rspamd-Action: no action
X-Spamd-Bar: ++
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D737E40F28
X-Spam-Level: **
X-Spamd-Result: default: False [2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[outlook.com,gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
Message-ID-Hash: CSP7LAKYHUD4OVOLGYAHE2C3ODEIN3O5
X-Message-ID-Hash: CSP7LAKYHUD4OVOLGYAHE2C3ODEIN3O5
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Steven Davis <goldside000@outlook.com>, hvaibhav.linux@gmail.com, elder@kernel.org, vireshk@kernel.org, dtwlin@gmail.com, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Fix capitalization and punctuation inconsistencies
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CSP7LAKYHUD4OVOLGYAHE2C3ODEIN3O5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 09, 2024 at 02:51:33PM +0200, Johan Hovold wrote:
> On Sun, Sep 01, 2024 at 05:18:59PM -0400, Steven Davis wrote:
> > There were a lot of inconsistencies in outputs and
> > comments, some were properly formatted and
> > capitalized, and some weren't. This patch resolves
> > this by properly formatting the inconsistent comments
> > and outputs.
> > 
> > Signed-off-by: Steven Davis <goldside000@outlook.com>
> > ---
> >  drivers/staging/greybus/arche-platform.c | 38 ++++++++++++------------
> >  drivers/staging/greybus/authentication.c |  6 ++--
> >  drivers/staging/greybus/bootrom.c        | 16 +++++-----
> >  drivers/staging/greybus/light.c          | 26 ++++++++--------
> >  drivers/staging/greybus/log.c            | 10 +++----
> >  5 files changed, 48 insertions(+), 48 deletions(-)
> 
> I didn't have time to reply here before Greg picked this one up, but I'm
> gonna ask for this one to be reverted.
> 
> The (core) greybus code uses lower case error messages so this patch is
> introducing an inconsistency instead of addressing one.
> 
> I just sent a revert here:
> 
> 	https://lore.kernel.org/20240909124853.9213-1-johan@kernel.org

Thanks for that, sorry about missing that.

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
