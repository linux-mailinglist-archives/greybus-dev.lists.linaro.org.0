Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1BDABECBA
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 09:06:08 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C4419443BB
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 07:06:07 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id A46693F68D
	for <greybus-dev@lists.linaro.org>; Wed, 21 May 2025 07:06:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=if833Ztc;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4C129A4DDEE;
	Wed, 21 May 2025 07:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42694C4CEE4;
	Wed, 21 May 2025 07:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747811163;
	bh=NjqaB0O3NiViOC6SIiau9SxCy8Ie5x4b0CTYJB1+P6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=if833ZtcnPVEc2BaZ/BxPYcp4EJn2F6hmrhTIQeTGHQOULHgmK19gpIT+UjELoSGP
	 biTk2btxVk4cCd9ipUxnJbzMgCmksUnFWSGpoN2hnzq7SpKMUpq2V1R/8WwXaj4d4p
	 Zc2oe5lZt/+gepvrZ/vFPAmuyFN6nzJgtoRrAWRY=
Date: Wed, 21 May 2025 09:06:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: rujra <braker.noob.kernel@gmail.com>
Message-ID: <2025052120-partner-sulfite-81dd@gregkh>
References: <CAG+54DZYz-4hW33Py9mihHDauWw55=_rP71s1MbCg-5gxw7J7Q@mail.gmail.com>
 <2025052116-diaphragm-payback-a3ef@gregkh>
 <CAG+54Db4k-sMVHUsUWx=oN-AXE5aife=Ugx4f49smGnhq6=-0g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG+54Db4k-sMVHUsUWx=oN-AXE5aife=Ugx4f49smGnhq6=-0g@mail.gmail.com>
X-Spam-Level: **
X-Spamd-Result: default: False [2.32 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-2.68)[98.60%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: A46693F68D
X-Spamd-Bar: ++
Message-ID-Hash: SWILLIU6SSLKCLHO44YDADLKCLDSRGKJ
X-Message-ID-Hash: SWILLIU6SSLKCLHO44YDADLKCLDSRGKJ
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH RESEND] staging : greybus : Documentation : firmware : Replace deprecated strncpy() with strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SWILLIU6SSLKCLHO44YDADLKCLDSRGKJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?


http://daringfireball.net/2007/07/on_top

On Wed, May 21, 2025 at 11:11:26AM +0530, rujra wrote:
> Hi greg,
> 
> why is this a RESEND ?:
> 
> >> I had sent the same patch 4 days ago and didn't get any reply , hence tried to resend the same patch for the same,
> here is earlier mail :
> https://mail.google.com/mail/u/1/?ik=f63b03515e&view=om&permmsgid=msg-a:s:12290863930259651721

That is a link to _your_ account, not a public record of your email :(

> ,
> 
> line does not match this:
> >> sorry , i could not get it what it is exactly ?, if possible can you share some insights or example so that from in future i would get it right.

Your "From:" line in your email does not match with the signed-off-by
line.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
