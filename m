Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGUIMgnonWlDSgQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Feb 2026 19:03:53 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3885618AEBA
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Feb 2026 19:03:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1178440494
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Feb 2026 17:58:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id F11A840490
	for <greybus-dev@lists.linaro.org>; Tue, 24 Feb 2026 17:58:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=ugbt0jJ+;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E3F560126;
	Tue, 24 Feb 2026 17:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD87C19423;
	Tue, 24 Feb 2026 17:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771955910;
	bh=gqFKmFP5oja9e0q7WtqA1k+cSbRKKZqDwSJRUc6jPOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ugbt0jJ+P5Xvx3uhvlMDllLVfwiIE3NTqK43dboxuf7uJBb/kG3kXuFV6B56oLNaL
	 QTyLohtmTgowk8COqWXcf5EuwJxSfV5rGKhWis7whaqlQFMp/uDpzhB4rKYpiq6sfC
	 3IIwvsnwAB9HYcTabgX5MH5oW9Z6rNfMHkhLB+Lk=
Date: Tue, 24 Feb 2026 09:58:24 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Message-ID: <2026022448-sprain-engaged-3f7a@gregkh>
References: <20260223195939.71151-1-azpijr@gmail.com>
 <20260224084508.88867-1-azpijr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260224084508.88867-1-azpijr@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: ITVRDGD6CPS6SVHOK5GGHFBTIAWRSRXU
X-Message-ID-Hash: ITVRDGD6CPS6SVHOK5GGHFBTIAWRSRXU
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: move topology allocation to codec probe
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ITVRDGD6CPS6SVHOK5GGHFBTIAWRSRXU/>
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
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.933];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,intel.com:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 3885618AEBA
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 09:44:23AM +0100, Jose A. Perez de Azpillaga wrote:
> The FIXME in gb_audio_probe noted that memory allocation for the
> topology should happen within the codec driver rather than the
> greybus helper.
> 
> Move the size-check and kzalloc from audio_gb.c to audio_module.c
> and update the function signature of gb_audio_gb_get_topology to
> accept the pointer. This clarifies ownership of the allocated memory.
> 
> Reported-by: kernel test robot <lkp@intel.com>

The kernel test robot did not ask for this patch, it reported a problem
with your v1 patch.

> Closes: https://lore.kernel.org/oe-kbuild-all/202602240844.4eT24iVh-lkp@intel.com/

Nor does this change fix anything.


> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---
> v2:
>  - Fixed build error by updating function prototype in audio_codec.h.
>  - Fixed 'struct gb_audio_topology has no member named size' by passing
>    size as an explicit argument to gb_audio_gb_get_topology().

Did you test this version as well?  But step back, why is this change
needed at all?

> ---
>  drivers/staging/greybus/audio_codec.h  |  2 +-
>  drivers/staging/greybus/audio_gb.c     | 33 +++-----------------------
>  drivers/staging/greybus/audio_module.c | 27 +++++++++++++++++----
>  3 files changed, 26 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
> index f3f7a7ec6be4..2d7c3f928b1d 100644
> --- a/drivers/staging/greybus/audio_codec.h
> +++ b/drivers/staging/greybus/audio_codec.h
> @@ -179,7 +179,7 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module);
> 
>  /* protocol related */
>  int gb_audio_gb_get_topology(struct gb_connection *connection,
> -			     struct gb_audio_topology **topology);
> +			     struct gb_audio_topology *topology, u16 size);

Adding a random new field to a function means that we need to look up
what that value is to try to figure out what is going on.  That makes
things much harder overall.  So did this make the code harder to
understand?

Why can't the size be determined automatically by this function?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
