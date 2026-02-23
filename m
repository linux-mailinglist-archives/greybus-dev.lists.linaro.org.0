Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKasNElenGkUFQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Feb 2026 15:03:53 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD13177AD3
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Feb 2026 15:03:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 684E64044E
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Feb 2026 13:54:55 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 771AB3F7DE
	for <greybus-dev@lists.linaro.org>; Mon, 23 Feb 2026 13:54:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=abnEpa4j;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D497844104;
	Mon, 23 Feb 2026 13:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C73C116D0;
	Mon, 23 Feb 2026 13:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771854892;
	bh=gA0W0NEXSUpUi1GRxkCf2xS2nGA5tG1NEYgLOBviZhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=abnEpa4jWzdlqD0cynQBSZFk+/OZWCOU+pnLD0+2JeXm7p+4C24YSrkIIP8+qUnul
	 eLxDdmRisZXW4msEshLT7kJttFpNN/Q4BIOVCYuDQrjEj+u1hFdi7+LB81dhjDJlls
	 SzcopLAoluJ1bwoarjNcUbnq/L9zc8IWXYLlLGPY=
Date: Mon, 23 Feb 2026 14:54:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hardik Phalet <hardik.phalet@pm.me>
Message-ID: <2026022310-unleaded-scoundrel-d443@gregkh>
References: <20260220062741.399677-1-hardik.phalet@pm.me>
 <20260220062741.399677-2-hardik.phalet@pm.me>
 <aZgWffV8wwa3MDW1@stanley.mountain>
 <DGJPGRAT9SXJ.1JK6YJQ9SJLNT@pm.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DGJPGRAT9SXJ.1JK6YJQ9SJLNT@pm.me>
X-Spamd-Bar: /
Message-ID-Hash: AYQTHOJQXSHK4Y6WBUTITJ5D2IYCL4LU
X-Message-ID-Hash: AYQTHOJQXSHK4Y6WBUTITJ5D2IYCL4LU
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Dan Carpenter <dan.carpenter@linaro.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/2] staging: greybus: audio: fix NULL dereference in gb_audio_manager_get_module()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AYQTHOJQXSHK4Y6WBUTITJ5D2IYCL4LU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email,pm.me:email]
X-Rspamd-Queue-Id: ECD13177AD3
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 10:09:33AM +0000, Hardik Phalet wrote:
> On Fri Feb 20, 2026 at 1:38 PM IST, Dan Carpenter wrote:
> > On Fri, Feb 20, 2026 at 06:30:10AM +0000, Hardik Phalet wrote:
> >> gb_audio_manager_get_module() calls gb_audio_manager_get_locked(), which
> >> can return NULL when the requested id does not exist. The returned
> >> pointer is dereferenced unconditionally via kobject_get(), leading to a
> >> NULL pointer dereference.
> >>
> >> Only take a kobject reference when the module is found.
> >>
> >> Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
> >> ---
> >>  drivers/staging/greybus/audio_manager.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/greybus/audio_manager.c
> >> index 27ca5f796c5f..1da8804e61ca 100644
> >> --- a/drivers/staging/greybus/audio_manager.c
> >> +++ b/drivers/staging/greybus/audio_manager.c
> >> @@ -111,7 +111,8 @@ struct gb_audio_manager_module *gb_audio_manager_get_module(int id)
> >
> > I don't think this gb_audio_manager_get_module() function is ever
> > called.  If it is then we need a Fixes tag.
> >
> > regards,
> > dan carpenter
> 
> Thanks for pointing that out.
> 
> I double-checked and could not find any in-tree callers for
> gb_audio_manager_get_module(), so this appears to be dead code and the
> NULL dereference is not reachable today.
> 
> Would you prefer that I drop this fix, or should I follow up with a
> cleanup patch?

Redo the series and just remove the unused functions entirely.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
