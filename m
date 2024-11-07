Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E37929C09F7
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Nov 2024 16:22:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E255841536
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Nov 2024 15:22:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 5C95040B65
	for <greybus-dev@lists.linaro.org>; Thu,  7 Nov 2024 15:22:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=gxY+5tfQ;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 590F15C4C1D;
	Thu,  7 Nov 2024 15:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC5E2C4CECD;
	Thu,  7 Nov 2024 15:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730992960;
	bh=vKrgrqu16tNf3GZ8c9u9NoA7wIjTcJf1oi4Jnf+fPAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gxY+5tfQpoXsobtdJ7qYsD9j4ozcCqxy59kGPVve+qbdf87c3JH1wA5SsDMqWIyt4
	 amOAkaK5DJtTbTAZHRDme5pYgmjWd1Q5O+ze3Ddtcu86Q18DfzYKQu6+R8Xx0iQFVJ
	 ehtLQ7nUdJRhWq+mTGQCJuXeFdL2AkeHljt6GOsqjHAnfn2opCpU1AT7AlXjdEXMjN
	 /oGjf/fZ2PPjUhOAgpdVWAfG9PGMguBmR3p6NlKN8RfFTkrK5cq6aiYnc7axQbFJch
	 7o8/DpB3urd+FMcvAJ2DVtMTuu74MWcx4wqfDoiSzrXRvf3TmlHC5GPmlNr8+wJDoM
	 84yEtArgSO+VQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t94LJ-000000004HS-1bjy;
	Thu, 07 Nov 2024 16:22:42 +0100
Date: Thu, 7 Nov 2024 16:22:41 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <ZyzbQQGEaBRIRYi1@hovoldconsulting.com>
References: <20241107113337.402042-1-chenqiuji666@gmail.com>
 <2024110724-overbuilt-liquid-3734@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2024110724-overbuilt-liquid-3734@gregkh>
X-Spamd-Result: default: False [-9.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	RBL_SENDERSCORE_REPUT_9(-1.00)[139.178.84.217:from];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5C95040B65
X-Spamd-Bar: --------
Message-ID-Hash: I76DTGUK75LFMUGXT6M2CQY2OTJNMHEA
X-Message-ID-Hash: I76DTGUK75LFMUGXT6M2CQY2OTJNMHEA
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Qiu-ji Chen <chenqiuji666@gmail.com>, dtwlin@gmail.com, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: uart: Fix atomicity violation in get_serial_info()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/I76DTGUK75LFMUGXT6M2CQY2OTJNMHEA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 07, 2024 at 04:11:00PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Nov 07, 2024 at 07:33:37PM +0800, Qiu-ji Chen wrote:
> > Our static checker found a bug where set_serial_info() uses a mutex, but 
> > get_serial_info() does not. Fortunately, the impact of this is relatively 
> > minor. It doesn't cause a crash or any other serious issues. However, if a 
> > race condition occurs between set_serial_info() and get_serial_info(), 
> > there is a chance that the data returned by get_serial_info() will be 
> > meaningless.
> 
> Trailing whitespace :(
> 
> You should fix your editor to highlight this so it doesn't keep showing
> up.
> 
> > 
> > Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
> > Fixes: 0aad5ad563c8 ("greybus/uart: switch to ->[sg]et_serial()")

> - You have marked a patch with a "Fixes:" tag for a commit that is in an
>   older released kernel, yet you do not have a cc: stable line in the
>   signed-off-by area at all, which means that the patch will not be
>   applied to any older kernel releases.  To properly fix this, please
>   follow the documented rules in the
>   Documentation/process/stable-kernel-rules.rst file for how to resolve
>   this.

The CC-stable tag was left out on purpose (on my request IIRC) as this
is not fixing anything that's really a problem and is basically just
shutting the static checker up.

I believe this was also reflected in the commit message of v2 (even if
"inconsistent" may have been a better word than "meaningless").

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
