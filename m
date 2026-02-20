Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPW7IIdRmGnpGAMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 13:20:23 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 0487016776C
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 13:20:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C74FC401BB
	for <lists+greybus-dev@lfdr.de>; Fri, 20 Feb 2026 12:20:21 +0000 (UTC)
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	by lists.linaro.org (Postfix) with ESMTPS id 981EB3F8EE
	for <greybus-dev@lists.linaro.org>; Fri, 20 Feb 2026 10:09:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=NvhpyIIR;
	spf=pass (lists.linaro.org: domain of hardik.phalet@pm.me designates 109.224.244.116 as permitted sender) smtp.mailfrom=hardik.phalet@pm.me;
	dmarc=pass (policy=quarantine) header.from=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771582179; x=1771841379;
	bh=rxDkQVYPUMPUKg82CLPv0ZsWBUjDjlpt9sW0o5OsfrY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NvhpyIIRe+rvbMKew5JbaSSo9JE9PT0aJ3+3xBZ9q+q0m/YLO0d0TvIGwvpVVklKp
	 Wg2TrLr7/i73575AnEt8wfVVEAvdfhHoAjns7jy7oH7cZdXIP2zrrpKvL6rF54Dfut
	 MXKfvvvOol85VWgQrP6pMUS5hUsYgHPNDlXHNjkhPSaa7ItX1r5swgmFNSs2j5pv6g
	 OKo3mXTEh+WZp+QvH3jhdSRjHlTu5hPy2EoUSEEqY7tE5wt0ZMWpLzhxG2FJBu3Ydd
	 bfEqOCQhmvjM/q2HVoo5B6+VoVoPYLB7J6LUKmWGFJdjI2bcYvU6rjonrnpW37B4Zt
	 UhM+IAj+5fBAg==
Date: Fri, 20 Feb 2026 10:09:33 +0000
To: Dan Carpenter <dan.carpenter@linaro.org>, Hardik Phalet <hardik.phalet@pm.me>
From: Hardik Phalet <hardik.phalet@pm.me>
Message-ID: <DGJPGRAT9SXJ.1JK6YJQ9SJLNT@pm.me>
In-Reply-To: <aZgWffV8wwa3MDW1@stanley.mountain>
References: <20260220062741.399677-1-hardik.phalet@pm.me> <20260220062741.399677-2-hardik.phalet@pm.me> <aZgWffV8wwa3MDW1@stanley.mountain>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: 06a9279b9549fc4c99661ea8ae459cec68a529ba
MIME-Version: 1.0
X-Spamd-Bar: ----
X-MailFrom: hardik.phalet@pm.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: OHH6VWN2UPPY6AEVA4FGKUPBOUE3A3L6
X-Message-ID-Hash: OHH6VWN2UPPY6AEVA4FGKUPBOUE3A3L6
X-Mailman-Approved-At: Fri, 20 Feb 2026 12:20:20 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/2] staging: greybus: audio: fix NULL dereference in gb_audio_manager_get_module()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OHH6VWN2UPPY6AEVA4FGKUPBOUE3A3L6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[pm.me : SPF not aligned (strict),quarantine];
	R_DKIM_REJECT(1.00)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[pm.me:-];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[hardik.phalet@pm.me,greybus-dev-bounces@lists.linaro.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,pm.me:mid,pm.me:email]
X-Rspamd-Queue-Id: 0487016776C
X-Rspamd-Action: no action

On Fri Feb 20, 2026 at 1:38 PM IST, Dan Carpenter wrote:
> On Fri, Feb 20, 2026 at 06:30:10AM +0000, Hardik Phalet wrote:
>> gb_audio_manager_get_module() calls gb_audio_manager_get_locked(), which
>> can return NULL when the requested id does not exist. The returned
>> pointer is dereferenced unconditionally via kobject_get(), leading to a
>> NULL pointer dereference.
>>
>> Only take a kobject reference when the module is found.
>>
>> Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
>> ---
>>  drivers/staging/greybus/audio_manager.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/greybus/audio_manager.c
>> index 27ca5f796c5f..1da8804e61ca 100644
>> --- a/drivers/staging/greybus/audio_manager.c
>> +++ b/drivers/staging/greybus/audio_manager.c
>> @@ -111,7 +111,8 @@ struct gb_audio_manager_module *gb_audio_manager_get_module(int id)
>
> I don't think this gb_audio_manager_get_module() function is ever
> called.  If it is then we need a Fixes tag.
>
> regards,
> dan carpenter

Thanks for pointing that out.

I double-checked and could not find any in-tree callers for
gb_audio_manager_get_module(), so this appears to be dead code and the
NULL dereference is not reachable today.

Would you prefer that I drop this fix, or should I follow up with a
cleanup patch?

Regards,
Hardik Phalet


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
