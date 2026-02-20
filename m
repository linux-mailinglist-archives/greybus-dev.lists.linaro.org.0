Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rOKAK6H7l2nu+wIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 07:13:53 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA6E164E7C
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 07:13:53 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 789943F7F2
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 06:07:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 619843F7F2
	for <greybus-dev@lists.linaro.org>; Fri, 20 Feb 2026 06:07:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=tFS+XWQj;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6ECF61843;
	Fri, 20 Feb 2026 06:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19557C116D0;
	Fri, 20 Feb 2026 06:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771567671;
	bh=+4BS3OOort1sjJLflJFcuSgUG7p1C987J8JYwDnMn3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tFS+XWQj1jXCyJ9qGfQpPOTaVcZeqrji4EGRmeY289SFiKj7cNCUZfrfSlWFFgMKB
	 jQS4y2OcEb61vTt1RWG5eWelmPbaEBe6qUqkb7fl3vlKZ/ogjG4cH3XpDpxY7r3/if
	 srCdEoNXKPaLCo2mIjyYU3FmEltwi85De7AbjgG4=
Date: Fri, 20 Feb 2026 07:07:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hardik Phalet <hardik.phalet@pm.me>
Message-ID: <2026022030-verdict-impotency-9d5f@gregkh>
References: <DGJJRT1BJV4H.1JGMNMC4SGKT7@pm.me>
 <DGJJTPL4YY7N.1JMN32YIUCHB8@pm.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DGJJTPL4YY7N.1JMN32YIUCHB8@pm.me>
X-Spamd-Bar: /
Message-ID-Hash: DH5MZQ3HAKN2YJ5ITLVTZII3JUP3IWK6
X-Message-ID-Hash: DH5MZQ3HAKN2YJ5ITLVTZII3JUP3IWK6
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-staging@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v1 1/2] staging: greybus: audio: fix NULL dereference in gb_audio_manager_get_module()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DH5MZQ3HAKN2YJ5ITLVTZII3JUP3IWK6/>
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
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 3AA6E164E7C
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 05:44:19AM +0000, Hardik Phalet wrote:
> Empty Message

Something went wrong, please resend these as a v2.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
