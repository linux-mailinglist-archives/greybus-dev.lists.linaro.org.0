Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIb+MOBwx2kcXgUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 28 Mar 2026 07:10:40 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 2802C34D7B4
	for <lists+greybus-dev@lfdr.de>; Sat, 28 Mar 2026 07:10:39 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D2A5A402EF
	for <lists+greybus-dev@lfdr.de>; Sat, 28 Mar 2026 06:02:34 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id BBAB93F8E9
	for <greybus-dev@lists.linaro.org>; Sat, 28 Mar 2026 06:02:31 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=gyP9A0jw;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A99F41ACD;
	Sat, 28 Mar 2026 06:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F917C4CEF7;
	Sat, 28 Mar 2026 06:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774677751;
	bh=CtXmSgzwsODD2OV1neFpuoIpgKVd9hrini9i7/cP8mA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gyP9A0jwT8vf8JIUZtEiFSr9+pRh5SJtVZJLkks96OwWySDNwVFSCA6GDlvGADIaJ
	 wzYn3avxf0HuMvco9NVz0DQuK5Ji8BDNtAwXxMC0Qm+t3+VIOzWEPgOQ+TKDuloIAA
	 eGe2LoSAiG1dxrqH51RVxgf/GVoB8a/sipRvPORk=
Date: Sat, 28 Mar 2026 07:02:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Shivam Gupta <shivgupta751157@gmail.com>
Message-ID: <2026032850-riverbed-distant-f96b@gregkh>
References: <20260328044527.10489-1-shivgupta751157@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260328044527.10489-1-shivgupta751157@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: QITQPSV3ECPEYE5BWGFC4LMF3MGKXWDN
X-Message-ID-Hash: QITQPSV3ECPEYE5BWGFC4LMF3MGKXWDN
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio_manager: Add missing newline to sysfs_emit outputs
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QITQPSV3ECPEYE5BWGFC4LMF3MGKXWDN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 2802C34D7B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 10:15:27AM +0530, Shivam Gupta wrote:
> sysfs_emit outputs in audio_manager_module.c do not include a terminating
> newline, which is required for proper sysfs formatting.
> 
> Add newline characters to all sysfs_emit format strings.
> 
> Signed-off-by: Shivam Gupta <shivgupta751157@gmail.com>

You just changed the user/kernel api here, are you _sure_ it is ok to do
so?  What tools just broke or were used to test this?  What tool asked
you to make this change?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
