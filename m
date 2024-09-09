Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 757539719F1
	for <lists+greybus-dev@lfdr.de>; Mon,  9 Sep 2024 14:51:21 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8311A4412D
	for <lists+greybus-dev@lfdr.de>; Mon,  9 Sep 2024 12:51:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 5F9923F619
	for <greybus-dev@lists.linaro.org>; Mon,  9 Sep 2024 12:51:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=XAScQvSu;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 77B7B5C5882;
	Mon,  9 Sep 2024 12:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81DCC4CEC5;
	Mon,  9 Sep 2024 12:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725886276;
	bh=FCM7QUxF9t/5Rbr8bek4qbmnESDmM8rDLSdHDKwEgno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XAScQvSufGoYBm7kSUi1tNRWrLNLp+MKttudG2dHKPATAroOkBSx51RMy7INbdP9h
	 849/nG9qnTKY8Wp4V8ccsBen7SCtAbQJurjvodcTH7NZdMj9IZdME3kgHkb2bxDVNS
	 fkbUx9a9oNMM0+3ODFNWgV+o/Uix6bQwcrkRjLg4yMxjcImtmvWkIDk8dwLMPRvEV8
	 +BU6Lu/ElDAK87+EzM5YizeMi5jr2pYdlGEfvcLyi4o+xe1Mks9eOsUoqiUHyPzcWQ
	 wWhcG3lyM2EKKAXYamu+9HJQOLrgBDEuwOXtRHco5VllEKrh3QXbTkfTAuMjXcKrTf
	 4UzFoPmdiT6Zw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sndrh-000000002SN-3uNj;
	Mon, 09 Sep 2024 14:51:33 +0200
Date: Mon, 9 Sep 2024 14:51:33 +0200
From: Johan Hovold <johan@kernel.org>
To: Steven Davis <goldside000@outlook.com>
Message-ID: <Zt7vVaxF2XP-_ZMA@hovoldconsulting.com>
References: <SJ2P223MB102660087EA9382BE5287FDBF7912@SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SJ2P223MB102660087EA9382BE5287FDBF7912@SJ2P223MB1026.NAMP223.PROD.OUTLOOK.COM>
X-Rspamd-Action: no action
X-Spamd-Bar: --
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5F9923F619
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217:c];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[kernel.org:+]
Message-ID-Hash: WMLIHVUNS3ZMM4DCUHSOXECD2RYMH5MK
X-Message-ID-Hash: WMLIHVUNS3ZMM4DCUHSOXECD2RYMH5MK
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: hvaibhav.linux@gmail.com, elder@kernel.org, vireshk@kernel.org, dtwlin@gmail.com, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Fix capitalization and punctuation inconsistencies
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WMLIHVUNS3ZMM4DCUHSOXECD2RYMH5MK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Sep 01, 2024 at 05:18:59PM -0400, Steven Davis wrote:
> There were a lot of inconsistencies in outputs and
> comments, some were properly formatted and
> capitalized, and some weren't. This patch resolves
> this by properly formatting the inconsistent comments
> and outputs.
> 
> Signed-off-by: Steven Davis <goldside000@outlook.com>
> ---
>  drivers/staging/greybus/arche-platform.c | 38 ++++++++++++------------
>  drivers/staging/greybus/authentication.c |  6 ++--
>  drivers/staging/greybus/bootrom.c        | 16 +++++-----
>  drivers/staging/greybus/light.c          | 26 ++++++++--------
>  drivers/staging/greybus/log.c            | 10 +++----
>  5 files changed, 48 insertions(+), 48 deletions(-)

I didn't have time to reply here before Greg picked this one up, but I'm
gonna ask for this one to be reverted.

The (core) greybus code uses lower case error messages so this patch is
introducing an inconsistency instead of addressing one.

I just sent a revert here:

	https://lore.kernel.org/20240909124853.9213-1-johan@kernel.org

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
