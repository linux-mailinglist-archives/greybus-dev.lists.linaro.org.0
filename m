Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PneDn/pnWlDSgQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Feb 2026 19:10:07 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D4218B076
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Feb 2026 19:10:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7E49240492
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Feb 2026 18:10:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 506384048F
	for <greybus-dev@lists.linaro.org>; Tue, 24 Feb 2026 18:10:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=l5Z3fi2A;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED49160097;
	Tue, 24 Feb 2026 18:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E2BC116D0;
	Tue, 24 Feb 2026 18:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771956601;
	bh=k8SOALTCYm/zag8PQJ5Hv/XinhIVj3Q7eRZzwQ9e6Ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5Z3fi2ANK47ViChSozcQBkOIvy5/U4zYM/HRGA4aFzf6fF4p63AffHcZEXSR1dpn
	 xOIKGQBeiS4TElTU/mQVRJyt+/cyHZIow/mg4B7m92JgJInzAWwK+AeUALGl7kRyIM
	 4WOgkKFYYtOwtrUbPYzbHMM/xULBnWwWcZkybWME=
Date: Tue, 24 Feb 2026 10:09:56 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Message-ID: <2026022438-gamma-blog-1561@gregkh>
References: <20260223181158.13234-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260223181158.13234-1-chakrabortyshubham66@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: URUKVFOVFPGUYFT4R6NJCIHOXRB3VWCE
X-Message-ID-Hash: URUKVFOVFPGUYFT4R6NJCIHOXRB3VWCE
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: audio: Use sysfs_emit in show functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/URUKVFOVFPGUYFT4R6NJCIHOXRB3VWCE/>
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
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.976];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: C8D4218B076
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 11:41:58PM +0530, Shubham Chakraborty wrote:
> Refactor sprintf to sysfs_emit in all show functions of the greybus
> audio manager module. This follows the standard kernel practice of
> using sysfs_emit for sysfs attributes, ensuring consistent output
> formatting and newline handling.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
> 
> v3:
>  - Add patch history below the --- line as requested by Greg KH.
> 
> v2:
>  - Add missing Signed-off-by line.
>  - Wrap commit message at 72 characters.
> 
>  drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index e87b82ca6..f22ee73eb 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -76,7 +76,7 @@ static void gb_audio_module_release(struct kobject *kobj)
>  static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
>                                          struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
> -       return sprintf(buf, "%s", module->desc.name);
> +       return sysfs_emit(buf, "%s\n", module->desc.name);

You just changed the output of all of these sysfs files by adding "\n"
to the end.  Why?

I don't think that's wrong, BUT it is a user/kernel api change, so you
need to document it, and ideally, that would happen in a separate change
from this one.

So can you do the conversion to sysfs_emit() with NO change in the
output, and a second one to add the \n if you really think it is needed.

And is it needed?  If so, why?  What tool uses these files and does it
now still work?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
