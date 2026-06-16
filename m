Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qdGpNNJmMWoeigUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jun 2026 17:08:02 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E569690C6A
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jun 2026 17:08:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=proton.me header.s=protonmail header.b=aefJsPGo;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (strict)" header.from=proton.me (policy=quarantine)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 73AC240A6A
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jun 2026 15:08:01 +0000 (UTC)
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	by lists.linaro.org (Postfix) with ESMTPS id 08C673F7D8
	for <greybus-dev@lists.linaro.org>; Tue, 16 Jun 2026 08:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1781597804; x=1781857004;
	bh=58Uh4BmTYBSHk+XlpcizYHlof13uI2OQMFFLUYMY02s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aefJsPGosdUrk/8b7SEsNnsTkFYymeQaGMz+PV28zYbZIDZg5oTRiMR02FkH72b1t
	 4pffG42Fjr3jllCENEw0nRZpzrCrdLYGTTgD4jkIY/y9vch7UXevcMTZXdQxgD/ySv
	 yEXrY1fSz4AJl/JQ8jgK3e5Tk3+zwtBmwt8d41mmkkaLg9LjHynjlTS8nwQmpuzpyT
	 rg4tXby+nBjkwfPVvx3hfJpMIWgXKBOSdyrK/9iOpnoNFrC746vEAYwUhfVE5Qq5bW
	 xdjfuC77leAMOmIvQBTTGdJqKFTA5zgrdksPxrZjkq51qOtGxXVPS2/mZuFNR8y3Nu
	 TLcjWQ3+x3dsw==
Date: Tue, 16 Jun 2026 08:16:39 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Bryam Vargas <hexlabsecurity@proton.me>
Message-ID: <20260616081635.169787-1-hexlabsecurity@proton.me>
In-Reply-To: <2026061643-crowbar-handgrip-620d@gregkh>
References: <20260616-b4-disp-4352e8b0-v1-1-3e09f62e0ad5@proton.me> <2026061643-crowbar-handgrip-620d@gregkh>
Feedback-ID: 199661219:user:proton
X-Pm-Message-ID: 084c8e8cd8c7820c2ed1ef584462455b8b1e9988
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: hexlabsecurity@proton.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: R3YGDSW2Z5FYRCTPF22KFOOP6LBXASAR
X-Message-ID-Hash: R3YGDSW2Z5FYRCTPF22KFOOP6LBXASAR
X-Mailman-Approved-At: Tue, 16 Jun 2026 15:07:46 +0000
CC: Dan Carpenter <error27@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: audio: bound the topology section sizes against the fetched size
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/R3YGDSW2Z5FYRCTPF22KFOOP6LBXASAR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[proton.me : SPF not aligned (strict),quarantine];
	R_DKIM_REJECT(1.00)[proton.me:s=protonmail];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:error27@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:greybus-dev@lists.linaro.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hexlabsecurity@proton.me,greybus-dev-bounces@lists.linaro.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,lists.linux.dev,lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[proton.me:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[hexlabsecurity@proton.me,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp,proton.me:mid,proton.me:from_mime,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E569690C6A

Hi Greg, and thanks Dan,

>> Are you sure these checks will not overflow?
> Yep.  The cast to u64 ensures that.

Right, and to close the other side of the comparison too: `size` is a u16 and
the function already does `if (size < sizeof(*topo)) return -ENODATA;` above
this point, so `size - sizeof(*topo)` cannot underflow either. The left side is
the (u64) sum of four u32s (max ~2^34), so neither side wraps. The form
`sizeof(*topo) + sum > size` is exactly equivalent if it reads more clearly.

> But we trust the hardware to send us proper data, right?  If we don't trust
> modules, then there are lots of other places stuff like this needs to be
> fixed, how many data paths did you audit?

I audited the four size_* fields that gbaudio_tplg_parse_data() turns into
section offsets -- those are the only module-supplied values that feed directly
into unchecked pointer arithmetic (control/widget/route_offset are dai_offset
plus those le32s, then dereferenced as structs). I am not claiming a broader
greybus or topology-parser audit; that is welcome but separate.

It is less "modules are malicious" than "a malformed or buggy module response
should not walk the parser off a slab object" -- the same
untrusted-length-to-offset shape already hardened for USB/HID/BT descriptors.
If you would rather treat module data as trusted and drop the stable tag, that
is your call; I would keep the bound regardless, since it is one branch and the
offsets are otherwise completely unchecked.

> How did you find/fix this?  You need to list what tools helped you...

I do not have real greybus audio hardware, so I simulated the module side and
drove the negative case directly: a topology whose fetched `size` is small but
whose size_* fields are large -- exactly the invariant this patch enforces.
With that I reproduced the read two ways:

  - in-kernel under KASAN (7.1.0-rc5): slab-out-of-bounds 4 bytes past a
    kmalloc-64 object; the patched arm (-EINVAL) and an in-bounds arm are clean;
  - a userspace AddressSanitizer model of the process_header() offset walk,
    both -m32 and -m64.

Tools: a static read of the audio_gb.c -> audio_topology.c data flow, a litmus
greybus module under KASAN in a VM, and the userspace ASan harness. The
verifiable artifact is the KASAN splat (trimmed under the --- in the original
posting; full log on request).

Thanks,
Bryam

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
