Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fnq8DAnuMGp9YwUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jun 2026 08:32:41 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id A751168C890
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jun 2026 08:32:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linuxfoundation.org header.s=korg header.b=oJ3WDhXa;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linuxfoundation.org (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 75F6B409CC
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jun 2026 06:32:39 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 7556F3F7DA
	for <greybus-dev@lists.linaro.org>; Tue, 16 Jun 2026 06:32:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA27643426;
	Tue, 16 Jun 2026 06:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65EF1F000E9;
	Tue, 16 Jun 2026 06:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781591554;
	bh=Mj1E3rBJ/+iFIagn9/wPFCB1+CPI0wixVL3RGiecfNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oJ3WDhXaKeRqT2pL1CjV7sBKhB2LXDN14jH+9daf6p9M4oFkumhLnUeBWUyTLSlzz
	 SPZ7EaxUlC7UUzRfyw9ZPCwWz1JNBfwM2bHeCA0RTpwtbVgB+TS+wBXFAw4AmGwhNY
	 rgGhZ98rwKHdrEyAqVE5d0Vn0HnfNcEFZfpbe14Q=
Date: Tue, 16 Jun 2026 12:01:30 +0530
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: hexlabsecurity@proton.me
Message-ID: <2026061643-crowbar-handgrip-620d@gregkh>
References: <20260616-b4-disp-4352e8b0-v1-1-3e09f62e0ad5@proton.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260616-b4-disp-4352e8b0-v1-1-3e09f62e0ad5@proton.me>
X-Spamd-Bar: /
Message-ID-Hash: PLMF34U6SUO4MABQIH7HGC5LW5SPIXKF
X-Message-ID-Hash: PLMF34U6SUO4MABQIH7HGC5LW5SPIXKF
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: audio: bound the topology section sizes against the fetched size
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PLMF34U6SUO4MABQIH7HGC5LW5SPIXKF/>
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
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hexlabsecurity@proton.me,m:johan@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:greybus-dev@lists.linaro.org,m:elder@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,proton.me:email,linuxfoundation.org:from_mime,lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A751168C890

On Tue, Jun 16, 2026 at 01:06:12AM -0500, Bryam Vargas via B4 Relay wrote:
> From: Bryam Vargas <hexlabsecurity@proton.me>
> 
> gb_audio_gb_get_topology() fetches a topology blob of a module-supplied
> size, and gbaudio_tplg_parse_data() then walks it by adding the
> module-supplied size_dais, size_controls and size_widgets fields to
> form the control, widget and route section offsets. Those le32 sizes
> are never checked against the fetched blob, so a module reporting a
> small topology size but large section sizes makes the offsets point
> past the allocation, and parsing reads out of bounds.

But we trust the hardware to send us proper data, right?  If we don't
trust modules, then there are lots of other places stuff like this needs
to be fixed, how many data paths did you audit?

> 
> Reject a topology whose section sizes do not fit within the fetched
> size before it is parsed.
> 
> Fixes: 184992e305f1 ("greybus: audio: Add Greybus Audio Device Class Protocol helper routines")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
> ---
> I reproduced the out-of-bounds read both in-kernel under KASAN and with
> a userspace AddressSanitizer model of the gbaudio_tplg_process_header()
> offset walk. The topology blob is kzalloc(size) where size is
> module-supplied (a u16), and process_header() forms control_offset =
> &data + size_dais, widget_offset = control_offset + size_controls, etc.;
> the consumers then read structs at those offsets.
> 
>   - In-kernel (7.1.0-rc5 + KASAN): a 64-byte blob (header 24, so 40 bytes
>     available) with size_dais = 44 makes control_offset point 4 bytes
>     past the allocation, and reading the first control byte there trips:
> 
>       BUG: KASAN: slab-out-of-bounds in ...parse_topology...
>       Read of size 1 at addr ...
>       ... which belongs to the cache kmalloc-64 of size 64
>       The buggy address is located 4 bytes to the right of
>        allocated 64-byte region
> 
>     The patched arm (sections rejected, -EINVAL) and an in-bounds control
>     arm (size_dais = 8) read cleanly with no KASAN report.
>   - ASan model (-m32 and -m64): size_dais = 4096 makes control_offset
>     point ~4 KB past the 64-byte blob - heap-buffer-overflow READ located
>     4056 bytes after the region, both ABIs; patched and in-bounds clean.
> 
> The source is a greybus audio module trust boundary (an attacker-supplied
> or compromised module reporting a malformed topology); the access is a
> read, and a large size_dais sends the offset far enough to fault. The
> reproducer (kernel module + ASan model) is available on request.


How did you find/fix this?  You need to list what tools helped you...

> ---
>  drivers/staging/greybus/audio_gb.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
> index 9d8994fdb41a..144591f1a512 100644
> --- a/drivers/staging/greybus/audio_gb.c
> +++ b/drivers/staging/greybus/audio_gb.c
> @@ -37,6 +37,19 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
>  		return ret;
>  	}
>  
> +	/*
> +	 * The size_* fields are supplied by the module and are used by
> +	 * gbaudio_tplg_parse_data() to compute offsets into the blob; make
> +	 * sure the sections fit within the fetched topology, so walking it
> +	 * cannot read out of bounds.
> +	 */
> +	if ((u64)le32_to_cpu(topo->size_dais) + le32_to_cpu(topo->size_controls) +
> +	    le32_to_cpu(topo->size_widgets) + le32_to_cpu(topo->size_routes) >
> +	    size - sizeof(*topo)) {

Are you sure these checks will not overflow?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
