Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKLdKrfkD2r+RAYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 22 May 2026 07:08:07 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 352945AEF79
	for <lists+greybus-dev@lfdr.de>; Fri, 22 May 2026 07:08:07 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EC3DB40969
	for <lists+greybus-dev@lfdr.de>; Fri, 22 May 2026 05:08:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 8995A3F75B
	for <greybus-dev@lists.linaro.org>; Fri, 22 May 2026 05:08:00 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=TjMjszYn;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 20DBC601E8;
	Fri, 22 May 2026 05:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073921F000E9;
	Fri, 22 May 2026 05:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779426479;
	bh=+9T+MJetygSRoKxcfVda2WKPfjsua3gdfJ1IwORPY94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TjMjszYnq3O1YYgH4/5iqmGqbYxgjAwsGmYWkHKGywsPvHh+zb35LyDeHSOcxjPnO
	 7ddvspYGzgn0waT8YmwbO5OKE4dRKWDwBrYxLMuBoW+b6UuCVscBOxwAGCONGSo14F
	 VQSx0hsTHGZdKAgP+4oTX7tdzQjHqPaRhs0KNl18=
Date: Fri, 22 May 2026 07:07:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Message-ID: <2026052249-shrank-trophy-14ff@gregkh>
References: <20260520180401.539215-1-grandmaster@al2klimov.de>
 <20260520180401.539215-3-grandmaster@al2klimov.de>
 <2026052158-willing-dreadful-857b@gregkh>
 <9caaf426-1912-43e0-949f-fb7bb6bbd1cc@al2klimov.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9caaf426-1912-43e0-949f-fb7bb6bbd1cc@al2klimov.de>
X-Spamd-Bar: /
Message-ID-Hash: WT5AXCI57K7H5BCM4NG74KFSIDFIGJQE
X-Message-ID-Hash: WT5AXCI57K7H5BCM4NG74KFSIDFIGJQE
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Elise Lennion <elise.lennion@gmail.com>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: expect 0 from kstrtoint(), not 1
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WT5AXCI57K7H5BCM4NG74KFSIDFIGJQE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [6.59 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.698];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lkml.org:url,al2klimov.de:email]
X-Rspamd-Queue-Id: 352945AEF79
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On Thu, May 21, 2026 at 08:42:06PM +0200, Alexander A. Klimov wrote:
> 
> 
> On 5/21/26 10:38, Greg Kroah-Hartman wrote:
> > On Wed, May 20, 2026 at 08:03:59PM +0200, Alexander A. Klimov wrote:
> > > kstrtoint() returns "0 on success, -ERANGE on overflow
> > > and -EINVAL on parsing error". In contrast,
> > > manager_sysfs_remove_store() and manager_sysfs_dump_store()
> > > checked for 1 which always failed the operation. I fixed this.
> > > 
> > > Fixes: f9a21a3f4919 ("staging: greybus: audio_manager_sysfs: Replace sscanf with kstrto* to single variable conversion.")
> > > Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> > > ---
> > >   drivers/staging/greybus/audio_manager_sysfs.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
> > > index fcd518f9540c..581791d566e3 100644
> > > --- a/drivers/staging/greybus/audio_manager_sysfs.c
> > > +++ b/drivers/staging/greybus/audio_manager_sysfs.c
> > > @@ -44,7 +44,7 @@ static ssize_t manager_sysfs_remove_store(struct kobject *kobj,
> > >   	int num = kstrtoint(buf, 10, &id);
> > > -	if (num != 1)
> > > +	if (num != 0)
> > 
> > Doesn't checkpatch now complain about this?
> No.
> 
> $ curl -fsSL https://lkml.org/lkml/diff/2026/5/20/2139/1 | scripts/checkpatch.pl

Please use lore.kernel.org, not lkml.

Also, when using b4 to apply this, it sucked in a bunch of other random
patches for you, please make new threads for everything you send.

> ERROR: Missing Signed-off-by: line(s)

Why is that showing up?

> total: 1 errors, 0 warnings, 0 checks, 16 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inplace.

What about trying --strict?

Anyway, think about rewriting the check for "== 0" now, that is not
normal kernel style.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
