Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hMF0DPrETGrNpQEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 07 Jul 2026 11:20:58 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7B3719ACD
	for <lists+greybus-dev@lfdr.de>; Tue, 07 Jul 2026 11:20:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linuxfoundation.org header.s=korg header.b=osbaFt4D;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linuxfoundation.org (policy=none);
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6BA2240A7B
	for <lists+greybus-dev@lfdr.de>; Tue,  7 Jul 2026 09:20:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id AA9ED404FD
	for <greybus-dev@lists.linaro.org>; Tue,  7 Jul 2026 09:20:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 33C0A618A6;
	Tue,  7 Jul 2026 09:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7042C1F000E9;
	Tue,  7 Jul 2026 09:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783416051;
	bh=B9lMLDHj6XcWua4XX1+0Cqa7Q6BbD5VdSnsxI49pPks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=osbaFt4DTKIMqdlaG5Sb4NQOQs3qdbWIztl8drPHfIiZV+0vjI/UbI6eXUhIZIJ/w
	 Q3luspMH3qMJDpYNyJ27GNhQC0vZASLgaI26jZI8BOFNfvekz2hKYO1xFd/lzHaI9j
	 BlkjbHx503jDPkTeZupbH5MPdc8PRccgKZ61sa0E=
Date: Tue, 7 Jul 2026 11:20:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: adi25charis@gmail.com
Message-ID: <2026070742-marathon-facsimile-648c@gregkh>
References: <20260629144941.33818-1-adi25charis@gmail.com>
 <20260630204908.40206-1-adi25charis@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260630204908.40206-1-adi25charis@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: D2OK2ZCHBQRM4ID7JYMO5DXRYYIS3EB2
X-Message-ID-Hash: D2OK2ZCHBQRM4ID7JYMO5DXRYYIS3EB2
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, error27@gmail.com, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: audio: split topology get into size and data calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/D2OK2ZCHBQRM4ID7JYMO5DXRYYIS3EB2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:adi25charis@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:error27@gmail.com,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:from_mime,gregkh:mid,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E7B3719ACD

On Wed, Jul 01, 2026 at 02:19:08AM +0530, adi25charis@gmail.com wrote:
> From: Aditya Chari S <adi25charis@gmail.com>
> 
> gb_audio_gb_get_topology() combined three separate responsibilities
> into a single call: querying the topology size, allocating a buffer
> for it, and fetching the topology data into that buffer. This left
> callers with no way to perform any of these steps independently, and
> forced the kzalloc() allocation to live inside the protocol-layer
> driver rather than the caller, as already flagged by a FIXME comment
> at the call site in audio_module.c.
> 
> Split the function into two:
> 
>   gb_audio_gb_get_topology_size() - queries only the topology size
>   gb_audio_gb_get_topology()      - fetches topology data into a
>                                      caller-supplied buffer of a
>                                      given size
> 
> Update the only caller, gb_audio_probe() in audio_module.c, to query
> the size first, allocate the topology buffer itself, then fetch the
> data into it, freeing the buffer via the existing free_topology error
> path on failure.
> 
> This resolves both the "TODO: Split into separate calls" comment
> above the original function in audio_gb.c and the FIXME comment at
> the call site in audio_module.c, both of which are removed as part
> of this change.
> 
> No functional change in behavior for the existing probe path.
> 
> Compile-tested with W=1, sparse (C=2), and checkpatch.pl; all clean
> on the three changed files (audio_gb.c, audio_module.c, audio_codec.h).
> 
> Signed-off-by: Aditya Chari S <adi25charis@gmail.com>

Does not apply to my tree :(
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
