Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 93438A782ED
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 21:52:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9B5A444551
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 19:52:09 +0000 (UTC)
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	by lists.linaro.org (Postfix) with ESMTPS id B284144551
	for <greybus-dev@lists.linaro.org>; Tue,  1 Apr 2025 19:51:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linux.dev header.s=key1 header.b=kFyU7slN;
	spf=pass (lists.linaro.org: domain of thorsten.blum@linux.dev designates 91.218.175.171 as permitted sender) smtp.mailfrom=thorsten.blum@linux.dev;
	dmarc=pass (policy=none) header.from=linux.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743537100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZzfmpSBUWlgmMuvl2RFbweDlXEH/+tHHYq+lHJwlh4o=;
	b=kFyU7slNlcxXI11fLgeRb/XJvMpDwnLjU7OAZGh5LbYWJCmBtrCGW6ZOpqzrs2zPp6qJva
	g37Kd7YyrSOmH0O1AfcmGjiJyLx9B9Q2yiaRbovAqwCYZ2nIEOMREovcPKEUGaIleX5t6t
	+Sy7PGN71vEgaucKO38qdxuorIXuZvU=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <8a68ab78-cf18-4937-a8b7-fb0fa41c9d53@ieee.org>
Date: Tue, 1 Apr 2025 21:51:27 +0200
Message-Id: <9288204E-F6B7-4C9D-AADB-511A845A2624@linux.dev>
References: <20250331183935.1880097-2-thorsten.blum@linux.dev>
 <8a68ab78-cf18-4937-a8b7-fb0fa41c9d53@ieee.org>
To: Alex Elder <elder@ieee.org>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B284144551
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.40 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	RBL_SENDERSCORE_REPUT_9(-1.00)[91.218.175.171:from];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:91.218.175.0/24];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MIME_GOOD(-0.10)[text/plain];
	ONCE_RECEIVED(0.10)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:202172, ipnet:91.218.175.0/24, country:CH];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.914];
	DKIM_TRACE(0.00)[linux.dev:+]
X-Rspamd-Action: no action
X-MailFrom: thorsten.blum@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: TRGIYFUUCA5YUZPLULBMXTCDGP2TVA2M
X-Message-ID-Hash: TRGIYFUUCA5YUZPLULBMXTCDGP2TVA2M
X-Mailman-Approved-At: Tue, 01 Apr 2025 19:52:06 +0000
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Remove unnecessary NUL-termination checks
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TRGIYFUUCA5YUZPLULBMXTCDGP2TVA2M/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1. Apr 2025, at 01:31, Alex Elder wrote:
> On 3/31/25 1:39 PM, Thorsten Blum wrote:
>> @@ -125,16 +125,6 @@ static int fw_mgmt_interface_fw_version_operation(struct fw_mgmt *fw_mgmt,
>>    	strscpy_pad(fw_info->firmware_tag, response.firmware_tag);
>>  -	/*
>> -	 * The firmware-tag should be NULL terminated, otherwise throw error but
>> -	 * don't fail.
>> -	 */
>> -	if (fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
>> -		dev_err(fw_mgmt->parent,
>> -			"fw-version: firmware-tag is not NULL terminated\n");
>> -		fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] = '\0';
>> -	}
> 
> Interesting this didn't return an error, while others below did.

Should I keep it that way when checking for a truncated firmware tag or
should this also fail like the others?

Thanks,
Thorsten

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
